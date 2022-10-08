metric="weighted"
feature_metric="weighted"
for seed in 42 0 1 2 3
do
    cmd="python train.py \
      --name cog_bart_meld_${metric}_$seed \
      --model CogBart \
      --model_path data/pretrained_models/cogbart_model_meld \
      --dataset meld \
      --batch_size 32 \
      --scheduler cosine \
      --gradient_accumulation_steps 1 \
      --lr 1e-5 \
      --seed $seed \
      --metric $metric \
      --feature_metric $feature_metric \
      --fc_dropout 0.1 \
      --epochs 10"
  echo "${cmd}"
  eval $cmd
done