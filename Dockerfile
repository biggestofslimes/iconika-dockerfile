FROM runpod/worker-comfyui:5.1.0-base

# Download models
RUN comfy model download --url https://huggingface.co/Alex42069/iconika-models/resolve/main/models/vae/ae.safetensors --relative-path models/vae --filename ae.safetensors
RUN comfy model download --url https://huggingface.co/Alex42069/iconika-models/resolve/main/models/clip/clip_l.safetensors --relative-path models/clip --filename clip_l.safetensors
RUN comfy model download --url https://huggingface.co/Alex42069/iconika-models/resolve/main/models/t5/t5xxl_fp16.safetensors --relative-path models/clip --filename t5xxl_fp16.safetensors
RUN comfy model download --url https://huggingface.co/Alex42069/iconika-models/resolve/main/models/fluxmania/fluxmania_Legacy.safetensors --relative-path models/checkpoints --filename fluxmania_Legacy.safetensors
RUN comfy model download --url https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/flux1-dev.safetensors --relative-path models/checkpoints --filename flux1-dev.safetensors

# New LoRAs
RUN comfy model download --url https://huggingface.co/Alex42069/iconika-models/resolve/main/models/lora/GrainScape_UltraReal_v2.safetensors --relative-path models/lora --filename GrainScape_UltraReal_v2.safetensors
RUN comfy model download --url https://huggingface.co/Alex42069/iconika-models/resolve/main/models/lora/Samsung_UltraReal.safetensors --relative-path models/lora --filename Samsung_UltraReal.safetensors
RUN comfy model download --url https://huggingface.co/Alex42069/iconika-models/resolve/main/models/lora/flux1-depth-dev-lora.safetensors --relative-path models/lora --filename flux1-depth-dev-lora.safetensors

# ✅ Correct way to install nodes on RunPod
RUN comfy-node-install comfyui-impact-pack comfyui-impact-subpack
