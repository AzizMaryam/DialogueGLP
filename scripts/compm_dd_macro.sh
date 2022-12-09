metric="weighted"
feature_metric="weighted"
for seed in 42 0 1 2 3
do
    cmd="python train.py \
      --name compm_meld_${metric}_$seed \
      --model CoMPM \
      --dataset daily_dialogue \
      --batch_size 2 \
      --scheduler cosine \
      --gradient_accumulation_steps 4 \
      --lr 1e-5 \
      --seed $seed \
      --metric $metric \
      --feature_metric $feature_metric \
      --fc_dropout 0.1 \
      --epochs 16"
  echo "${cmd}"
  eval $cmd
done