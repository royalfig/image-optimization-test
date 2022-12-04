#! /bin/bash
echo "Starting image compression 🖼️"

rm -rf assets
mkdir assets

cd assets

cp ../$1 ./cactus.jpg

echo "Resizing and compressing 💪"

npx @squoosh/cli --mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' \
 -s -compressed $1

npx @squoosh/cli --avif '{"cqLevel":33,"cqAlphaLevel":-1,"denoiseLevel":0,"tileColsLog2":0,"tileRowsLog2":0,"speed":6,"subsample":1,"chromaDeltaQ":false,"sharpness":0,"tune":0}' $1

npx @squoosh/cli --webp '{"quality":75,"target_size":0,"target_PSNR":0,"method":4,"sns_strength":50,"filter_strength":60,"filter_sharpness":0,"filter_type":1,"partitions":0,"segments":4,"pass":1,"show_compressed":0,"preprocessing":0,"autofilter":0,"partition_limit":0,"alpha_compression":1,"alpha_filtering":1,"alpha_quality":100,"lossless":0,"exact":0,"image_hint":0,"emulate_jpeg_size":0,"thread_level":0,"low_memory":0,"near_lossless":100,"use_delta_palette":0,"use_sharp_yuv":0}' $1

npx @squoosh/cli --resize '{"enabled":true,"width":1500,"height":1018,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--mozjpeg '{"quality":100,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' \
 -s -resized $1

npx @squoosh/cli --resize '{"enabled":true,"width":1500,"height":1500,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' \
 -s -resized-and-compressed $1

echo "Responsive image generation 🪄"

npx @squoosh/cli --resize '{"enabled":true,"width":300,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' \
 -s -300 $1

npx @squoosh/cli --resize '{"enabled":true,"width":500,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' \
-s -500 $1

npx @squoosh/cli --resize '{"enabled":true,"width":700,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' \
-s -700 $1

npx @squoosh/cli --resize '{"enabled":true,"width":900,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' \
-s -900 $1

npx @squoosh/cli --resize '{"enabled":true,"width":1100,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' \
-s -1100 $1

npx @squoosh/cli --resize '{"enabled":true,"width":1300,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' \
-s -1300 $1

npx @squoosh/cli --resize '{"enabled":true,"width":1500,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' \
-s -1500 $1

npx @squoosh/cli --resize '{"enabled":true,"width":1700,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' \
-s -1700 $1

npx @squoosh/cli --resize '{"enabled":true,"width":1900,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' \
-s -1900 $1

npx @squoosh/cli --resize '{"enabled":true,"width":2100,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' \
-s -2100 $1

# AVIF
npx @squoosh/cli --resize '{"enabled":true,"width":300,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--avif '{"cqLevel":33,"cqAlphaLevel":-1,"denoiseLevel":0,"tileColsLog2":0,"tileRowsLog2":0,"speed":6,"subsample":1,"chromaDeltaQ":false,"sharpness":0,"tune":0}' \
 -s -300 $1

npx @squoosh/cli --resize '{"enabled":true,"width":500,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--avif '{"cqLevel":33,"cqAlphaLevel":-1,"denoiseLevel":0,"tileColsLog2":0,"tileRowsLog2":0,"speed":6,"subsample":1,"chromaDeltaQ":false,"sharpness":0,"tune":0}' \
-s -500 $1

npx @squoosh/cli --resize '{"enabled":true,"width":700,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--avif '{"cqLevel":33,"cqAlphaLevel":-1,"denoiseLevel":0,"tileColsLog2":0,"tileRowsLog2":0,"speed":6,"subsample":1,"chromaDeltaQ":false,"sharpness":0,"tune":0}' \
-s -700 $1

npx @squoosh/cli --resize '{"enabled":true,"width":900,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--avif '{"cqLevel":33,"cqAlphaLevel":-1,"denoiseLevel":0,"tileColsLog2":0,"tileRowsLog2":0,"speed":6,"subsample":1,"chromaDeltaQ":false,"sharpness":0,"tune":0}' \
-s -900 $1

npx @squoosh/cli --resize '{"enabled":true,"width":1100,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--avif '{"cqLevel":33,"cqAlphaLevel":-1,"denoiseLevel":0,"tileColsLog2":0,"tileRowsLog2":0,"speed":6,"subsample":1,"chromaDeltaQ":false,"sharpness":0,"tune":0}' \
-s -1100 $1

npx @squoosh/cli --resize '{"enabled":true,"width":1300,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--avif '{"cqLevel":33,"cqAlphaLevel":-1,"denoiseLevel":0,"tileColsLog2":0,"tileRowsLog2":0,"speed":6,"subsample":1,"chromaDeltaQ":false,"sharpness":0,"tune":0}' \
-s -1300 $1

npx @squoosh/cli --resize '{"enabled":true,"width":1500,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--avif '{"cqLevel":33,"cqAlphaLevel":-1,"denoiseLevel":0,"tileColsLog2":0,"tileRowsLog2":0,"speed":6,"subsample":1,"chromaDeltaQ":false,"sharpness":0,"tune":0}' \
-s -1500 $1

npx @squoosh/cli --resize '{"enabled":true,"width":1700,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--avif '{"cqLevel":33,"cqAlphaLevel":-1,"denoiseLevel":0,"tileColsLog2":0,"tileRowsLog2":0,"speed":6,"subsample":1,"chromaDeltaQ":false,"sharpness":0,"tune":0}' \
-s -1700 $1

npx @squoosh/cli --resize '{"enabled":true,"width":1900,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--avif '{"cqLevel":33,"cqAlphaLevel":-1,"denoiseLevel":0,"tileColsLog2":0,"tileRowsLog2":0,"speed":6,"subsample":1,"chromaDeltaQ":false,"sharpness":0,"tune":0}' \
-s -1900 $1

npx @squoosh/cli --resize '{"enabled":true,"width":2100,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--avif '{"cqLevel":33,"cqAlphaLevel":-1,"denoiseLevel":0,"tileColsLog2":0,"tileRowsLog2":0,"speed":6,"subsample":1,"chromaDeltaQ":false,"sharpness":0,"tune":0}' \
-s -2100 $1

# WEBP
npx @squoosh/cli --resize '{"enabled":true,"width":300,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--webp '{"quality":75,"target_size":0,"target_PSNR":0,"method":4,"sns_strength":50,"filter_strength":60,"filter_sharpness":0,"filter_type":1,"partitions":0,"segments":4,"pass":1,"show_compressed":0,"preprocessing":0,"autofilter":0,"partition_limit":0,"alpha_compression":1,"alpha_filtering":1,"alpha_quality":100,"lossless":0,"exact":0,"image_hint":0,"emulate_jpeg_size":0,"thread_level":0,"low_memory":0,"near_lossless":100,"use_delta_palette":0,"use_sharp_yuv":0}' \
 -s -300 $1

npx @squoosh/cli --resize '{"enabled":true,"width":500,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--webp '{"quality":75,"target_size":0,"target_PSNR":0,"method":4,"sns_strength":50,"filter_strength":60,"filter_sharpness":0,"filter_type":1,"partitions":0,"segments":4,"pass":1,"show_compressed":0,"preprocessing":0,"autofilter":0,"partition_limit":0,"alpha_compression":1,"alpha_filtering":1,"alpha_quality":100,"lossless":0,"exact":0,"image_hint":0,"emulate_jpeg_size":0,"thread_level":0,"low_memory":0,"near_lossless":100,"use_delta_palette":0,"use_sharp_yuv":0}' \
-s -500 $1

npx @squoosh/cli --resize '{"enabled":true,"width":700,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--webp '{"quality":75,"target_size":0,"target_PSNR":0,"method":4,"sns_strength":50,"filter_strength":60,"filter_sharpness":0,"filter_type":1,"partitions":0,"segments":4,"pass":1,"show_compressed":0,"preprocessing":0,"autofilter":0,"partition_limit":0,"alpha_compression":1,"alpha_filtering":1,"alpha_quality":100,"lossless":0,"exact":0,"image_hint":0,"emulate_jpeg_size":0,"thread_level":0,"low_memory":0,"near_lossless":100,"use_delta_palette":0,"use_sharp_yuv":0}' \
-s -700 $1

npx @squoosh/cli --resize '{"enabled":true,"width":900,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--webp '{"quality":75,"target_size":0,"target_PSNR":0,"method":4,"sns_strength":50,"filter_strength":60,"filter_sharpness":0,"filter_type":1,"partitions":0,"segments":4,"pass":1,"show_compressed":0,"preprocessing":0,"autofilter":0,"partition_limit":0,"alpha_compression":1,"alpha_filtering":1,"alpha_quality":100,"lossless":0,"exact":0,"image_hint":0,"emulate_jpeg_size":0,"thread_level":0,"low_memory":0,"near_lossless":100,"use_delta_palette":0,"use_sharp_yuv":0}' \
-s -900 $1

npx @squoosh/cli --resize '{"enabled":true,"width":1100,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--webp '{"quality":75,"target_size":0,"target_PSNR":0,"method":4,"sns_strength":50,"filter_strength":60,"filter_sharpness":0,"filter_type":1,"partitions":0,"segments":4,"pass":1,"show_compressed":0,"preprocessing":0,"autofilter":0,"partition_limit":0,"alpha_compression":1,"alpha_filtering":1,"alpha_quality":100,"lossless":0,"exact":0,"image_hint":0,"emulate_jpeg_size":0,"thread_level":0,"low_memory":0,"near_lossless":100,"use_delta_palette":0,"use_sharp_yuv":0}' \
-s -1100 $1

npx @squoosh/cli --resize '{"enabled":true,"width":1300,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--webp '{"quality":75,"target_size":0,"target_PSNR":0,"method":4,"sns_strength":50,"filter_strength":60,"filter_sharpness":0,"filter_type":1,"partitions":0,"segments":4,"pass":1,"show_compressed":0,"preprocessing":0,"autofilter":0,"partition_limit":0,"alpha_compression":1,"alpha_filtering":1,"alpha_quality":100,"lossless":0,"exact":0,"image_hint":0,"emulate_jpeg_size":0,"thread_level":0,"low_memory":0,"near_lossless":100,"use_delta_palette":0,"use_sharp_yuv":0}' \
-s -1300 $1

npx @squoosh/cli --resize '{"enabled":true,"width":1500,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--webp '{"quality":75,"target_size":0,"target_PSNR":0,"method":4,"sns_strength":50,"filter_strength":60,"filter_sharpness":0,"filter_type":1,"partitions":0,"segments":4,"pass":1,"show_compressed":0,"preprocessing":0,"autofilter":0,"partition_limit":0,"alpha_compression":1,"alpha_filtering":1,"alpha_quality":100,"lossless":0,"exact":0,"image_hint":0,"emulate_jpeg_size":0,"thread_level":0,"low_memory":0,"near_lossless":100,"use_delta_palette":0,"use_sharp_yuv":0}' \
-s -1500 $1

npx @squoosh/cli --resize '{"enabled":true,"width":1700,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--webp '{"quality":75,"target_size":0,"target_PSNR":0,"method":4,"sns_strength":50,"filter_strength":60,"filter_sharpness":0,"filter_type":1,"partitions":0,"segments":4,"pass":1,"show_compressed":0,"preprocessing":0,"autofilter":0,"partition_limit":0,"alpha_compression":1,"alpha_filtering":1,"alpha_quality":100,"lossless":0,"exact":0,"image_hint":0,"emulate_jpeg_size":0,"thread_level":0,"low_memory":0,"near_lossless":100,"use_delta_palette":0,"use_sharp_yuv":0}' \
-s -1700 $1

npx @squoosh/cli --resize '{"enabled":true,"width":1900,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--webp '{"quality":75,"target_size":0,"target_PSNR":0,"method":4,"sns_strength":50,"filter_strength":60,"filter_sharpness":0,"filter_type":1,"partitions":0,"segments":4,"pass":1,"show_compressed":0,"preprocessing":0,"autofilter":0,"partition_limit":0,"alpha_compression":1,"alpha_filtering":1,"alpha_quality":100,"lossless":0,"exact":0,"image_hint":0,"emulate_jpeg_size":0,"thread_level":0,"low_memory":0,"near_lossless":100,"use_delta_palette":0,"use_sharp_yuv":0}' \
-s -1900 $1

npx @squoosh/cli --resize '{"enabled":true,"width":2100,"method":"lanczos3","fitMethod":"stretch","premultiply":true,"linearRGB":true}' \
--webp '{"quality":75,"target_size":0,"target_PSNR":0,"method":4,"sns_strength":50,"filter_strength":60,"filter_sharpness":0,"filter_type":1,"partitions":0,"segments":4,"pass":1,"show_compressed":0,"preprocessing":0,"autofilter":0,"partition_limit":0,"alpha_compression":1,"alpha_filtering":1,"alpha_quality":100,"lossless":0,"exact":0,"image_hint":0,"emulate_jpeg_size":0,"thread_level":0,"low_memory":0,"near_lossless":100,"use_delta_palette":0,"use_sharp_yuv":0}' \
-s -2100 $1

echo "It's all done. Images resized, compressed, and converted."