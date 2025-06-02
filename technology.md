# [Indy](README.md) - Technology

## Global

### Resolution

- 16 / 9: 3840 x 2160
- 21 / 9: 5040 x 2160

## Generative tools

### Image generation

Midjourney: https://www.midjourney.com

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

### Voice generation

ElevenLabs: https://elevenlabs.io

videotosoundeffects: https://www.videotosoundeffects.com

### Lipsync

LivePortrait: https://github.com/KwaiVGI/LivePortrait

Configuration:
- Code changes
    - crf=15 (inference_config.py / video.py)
    - flag_normalize_lip: bool = True (argument_config.py)
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
    - Size: 5040x2160
    - Frame rate: 24fps
    - Pixel aspect ratio: 1
    - Display aspect ratio: 21:9
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
