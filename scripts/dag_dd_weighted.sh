metric="weighted"
feature_metric="weighted"
for seed in 42 0 1 2 3
do
    cmd="python train.py \
      --name dag_emorynlp_${metric}_$seed \
      --model DAG \
      --dataset daily_dialogue \
      --batch_size 8 \
      --scheduler fixed \
      --gradient_accumulation_steps 1 \
      --lr 0.00005 \
      --seed $seed \
      --metric $metric \
      --feature_metric $feature_metric \
      --epochs 30 \
      --fc_dropout 0.1"
  echo "${cmd}"
  eval $cmd
done