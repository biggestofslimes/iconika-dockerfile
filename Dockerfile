FROM runpod/worker-comfyui:5.1.0-base

# Add ComfyUI's official node implementations
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /root/ComfyUI \
 && mkdir -p /comfyui/custom_nodes \
 && cp -r /root/ComfyUI/custom_nodes/* /comfyui/custom_nodes/

# Download models
RUN comfy model download --url https://huggingface.co/Alex42069/iconika-models/resolve/main/models/ultrareal/ultrarealFineTune_v4.safetensors --relative-path models/checkpoints --filename ultrarealFineTune_v4.safetensors
RUN comfy model download --url https://huggingface.co/Alex42069/iconika-models/resolve/main/models/vae/ae.safetensors --relative-path models/vae --filename ae.safetensors
RUN comfy model download --url https://huggingface.co/Alex42069/iconika-models/resolve/main/models/clip/clip_l.safetensors --relative-path models/clip --filename clip_l.safetensors
RUN comfy model download --url https://huggingface.co/Alex42069/iconika-models/resolve/main/models/t5/t5xxl_fp16.safetensors --relative-path models/t5 --filename t5xxl_fp16.safetensors
