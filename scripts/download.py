import os
os.environ["HF_HUB_ENABLE_HF_TRANSFER"] = "1" 

from huggingface_hub import snapshot_download

snapshot_download(
    repo_id = "Wan-AI/Wan2.2-T2V-A14B-Diffusers",
    local_dir = "models/Wan-AI/Wan2.2-T2V-A14B-Diffusers"
)

