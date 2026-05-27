#!/usr/bin/env python3
# safe_extract.py - extract archive to dest with path traversal protection
# usage: safe_extract.py <archive> <destdir>

import sys
import os
import gzip
import bz2
import lzma
import libarchive.extract
import libarchive.read
import magic
import malcolm_utils
import re
import subprocess

EXTRACT_FLAGS = (
    libarchive.extract.EXTRACT_SECURE_NODOTDOT
    | libarchive.extract.EXTRACT_SECURE_NOABSOLUTEPATHS
    | libarchive.extract.EXTRACT_SECURE_SYMLINKS
)

# Raw single-stream compression formats: no container, no member paths.
# Decompress to a single output file via stdlib.
RAW_STREAM_MIMES = {
    'application/gzip': gzip.open,
    'application/x-gzip': gzip.open,
    'application/x-bzip2': bz2.open,
    'application/x-xz': lzma.open,
    'application/x-lzma': lzma.open,
}

TAR_COMPRESSED_EXTS = re.compile(
    r'\.(tgz|tbz2?|txz|tlz|tar\.(gz|bz2|xz|lz|lzma))$',
    flags=re.IGNORECASE,
)


def strip_compression_ext(path):
    return (
        re.sub(
            r'\.(gz|bz2|xz|lz|lzma)$',
            '',
            os.path.basename(path),
            flags=re.IGNORECASE,
        )
        or 'decompressed'
    )


def extract_raw_stream(archive, dest, archive_mime=None):
    open_fn = RAW_STREAM_MIMES[archive_mime if archive_mime else magic.from_file(archive, mime=True)]
    outname = strip_compression_ext(archive)
    outpath = os.path.join(dest, outname)
    with open_fn(archive, 'rb') as src, open(outpath, 'wb') as dst:
        while chunk := src.read(65536):
            dst.write(chunk)


def extract_lzip(archive, dest):
    outname = strip_compression_ext(archive)
    outpath = os.path.join(dest, outname)
    with open(outpath, 'wb') as dst:
        subprocess.run(['lzip', '-d', '-c', archive], stdout=dst, check=True)


def extract_libarchive(archive, dest):
    """Extract an archive using libarchive with security flags.
    Iterates entries manually to skip directory entries that some
    formats (e.g. RAR) mark in a way that confuses extract_file."""
    with malcolm_utils.pushd(dest):
        with libarchive.read.file_reader(archive) as a:
            for entry in a:
                if entry.isdir:
                    # create the directory explicitly rather than letting
                    # libarchive attempt to decompress it as a data entry
                    dirpath = os.path.join(dest, entry.pathname)
                    os.makedirs(dirpath, exist_ok=True)
                    continue
                libarchive.extract.extract_entries([entry], flags=EXTRACT_FLAGS)


if len(sys.argv) != 3:
    print(f"Usage: {sys.argv[0]} <archive> <destdir>", file=sys.stderr)
    sys.exit(1)

archive = os.path.realpath(sys.argv[1])
dest = os.path.realpath(sys.argv[2])

os.makedirs(dest, exist_ok=True)

file_mime_type = magic.from_file(archive, mime=True)

if TAR_COMPRESSED_EXTS.search(archive):
    extract_libarchive(archive, dest)
elif file_mime_type in RAW_STREAM_MIMES:
    extract_raw_stream(archive, dest, file_mime_type)
elif file_mime_type == 'application/x-lzip':
    extract_lzip(archive, dest)
else:
    extract_libarchive(archive, dest)
