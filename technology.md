# [Indy](README.md) - Technology

## Global

### Resolution

- 16 / 9: 3840 x 2160

- Cinemascope: 5160 x 2160
    - 2912 x 1632 -> 3900 x 1632
    - 2560 x 1435 -> 3428 x 1435
    - 5824 x 3264 -> 7798 x 3264

## Generative tools

### API toolbox

Freepik: https://www.freepik.com
    - Magnific upscaling

fal.ai: https://fal.ai/dashboard
    - Flux Kontext

### Image generation

Midjourney: https://www.midjourney.com

Flux Kontext: https://bfl.ai/models/flux-kontext

Gemini 2.5 Flash: https://deepmind.google/models/gemini/flash

FaceFusion: https://github.com/facefusion/facefusion

### Image upscaling

Magnific AI: https://magnific.ai

### Video generation

Runway Gen-2: https://research.runwayml.com/gen2

Kling: https://klingai.com

Luma Dream Machine: https://lumalabs.ai

### Video upscaling

Topaz Video AI: https://topazlabs.com

### Audio generation

ElevenLabs: https://elevenlabs.io

videotosoundeffects: https://www.videotosoundeffects.com

MMAudio:
    - https://huggingface.co/spaces/hkchengrex/MMAudio
    - https://github.com/hkchengrex/MMAudio

### Voice generation

ElevenLabs: https://elevenlabs.io

### Lipsync

LivePortrait:
    - https://github.com/KwaiVGI/LivePortrait
    - https://huggingface.co/cleardusk/LivePortrait-Windows/tree/main

Configuration:
- Code changes (Sky-runtime/bash/generate/LivePortrait/patch.txt)
    - crf=15 (inference_config.py / video.py)
    - flag_normalize_lip: bool = True (argument_config.py)
    - max_dim 1280 -> 3840

- Driving Video
    - do crop: enabled

## Resources

### Audio effects

Pixabay: https://pixabay.com/fr/sound-effects

## Tools

### Platform OS

Windows 11: https://www.microsoft.com/en-us/windows
- More suitable for Photoshop
- Better Nvidia drivers for Topaz nvcenc upscaling

NOTE: This workflow should be feasible on macOS.

### Script automation

Git for Windows: https://gitforwindows.org

### Image composition

Adobe Photoshop 2024: https://www.adobe.com/products/photoshop

### Video edition

Kdenlive: https://kdenlive.org

Configuration:

- Project profile
    - Size: 3840x2160
    - Frame rate: 24fps
    - Pixel aspect ratio: 1
    - Display aspect ratio: 16:9
    - Colorspace: IUT-R BT.709
    - Scanning: Progressive
    - Field order: Top Field First

- Project profile
    - Size: 5160x2160
    - Frame rate: 24fps
    - Pixel aspect ratio: 1
    - Display aspect ratio: 43:18
    - Colorspace: IUT-R BT.709
    - Scanning: Progressive
    - Field order: Top Field First

## Language

### Video language

VBML: https://omega.gg/VBML

## Runtime

### Semantic Player

MotionMonkey: https://omega.gg/MotionMonkey

### Video Browser

MotionBox: https://omega.gg/MotionBox
