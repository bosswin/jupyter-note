#!/bin/bash
# Vox to wav
vox_dir=${1}
wav_dir=${2}
if [[ -z ${vox_dir} ]]; then
  echo "[ERROR] no argument variable is passed as a directory, exiting ..."
  exit 64
fi
if [[ ! -d ${vox_dir} ]]; then
  echo "[ERROR] There is no ${v3_dir} directory"
  exit 64
fi
if [[ -z ${wav_dir} ]]; then
  echo "[ERROR] no argument variable is passed as an output directory, exiting ..."
  exit 64
fi
if [[ ! -d ${wav_dir} ]]; then
  echo "[INFO] Creating ${wav_dir} directory"
  mkdir $wav_dir
fi
echo "[INFO] Converting v3 files in directory ${vox_dir}"
for sound_file in $(ls ${vox_dir}); 
do
  sound_path="${vox_dir}/${sound_file}"
  wav_path="${wav_dir}/${sound_file}.wav"
  ffmpeg -loglevel quiet -f u8 -c pcm_mulaw -ar 8000 -i $sound_path $wav_path
  echo "[INFO] Converted ${sound_path} to ${wav_path}"
done
