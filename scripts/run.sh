#!/bin/bash

# Download required models
python scripts/download.py

# Sample Wan 2.2 text to video 
PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True python scripts/t2v.py --prompt "Over-the-shoulder shot, two shot, telephoto lens, warm colors, high contrast lighting, soft lighting, daylight, daylight, close-up shot, center composition.In an eye-level shot, a foreign girl sits by a window. She is wearing a red and black striped sweater over a blue turtleneck, and her short, smooth golden hair is tucked behind her ears. Her gaze is gentle as she looks at someone off-camera with a slight smile, her expression natural and friendly. Her hands are gently folded on the table, where an open book and a white ceramic cup with steam gently rising are placed. The background is out-of-focus, with soft daylight streaming in through the window. Faint warm yellow lights and scattered red decorations are visible, creating a cozy atmosphere."

