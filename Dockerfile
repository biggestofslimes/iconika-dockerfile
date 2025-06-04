FROM runpod/worker-comfyui:5.1.0-base

# Install official ComfyUI node definitions
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /tmp/comfy \
 && mkdir -p /comfyui/custom_nodes \
 && cp -r /tmp/comfy/custom_nodes/* /comfyui/custom_nodes/ \
 && rm -rf /tmp/comfy

# Download models
RUN comfy model download --url https://huggingface.co/Alex42069/iconika-models/resolve/main/models/ultrareal/ultrarealFineTune_v4.safetensors --relative-path models/checkpoints --filename ultrarealFineTune_v4.safetensors
RUN comfy model download --url https://huggingface.co/Alex42069/iconika-models/resolve/main/models/vae/ae.safetensors --relative-path models/vae --filename ae.safetensors
RUN comfy model download --url https://huggingface.co/Alex42069/iconika-models/resolve/main/models/clip/clip_l.safetensors --relative-path models/clip --filename clip_l.safetensors
RUN comfy model download --url https://huggingface.co/Alex42069/iconika-models/resolve/main/models/t5/t5xxl_fp16.safetensors --relative-path models/t5 --filename t5xxl_fp16.safetensors
