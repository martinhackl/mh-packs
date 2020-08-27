#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
out_dir="${__dir}/../dist"
pack="${1}"
pack_dir="${__dir}/../packs/${pack}"

[ -d ${out_dir} ] || mkdir ${out_dir}

echo "Building package ${pack}..."
cd ${pack_dir}
npx vsce package
mv *.vsix ${out_dir}

echo "Building package ${pack}...FINISHED"
