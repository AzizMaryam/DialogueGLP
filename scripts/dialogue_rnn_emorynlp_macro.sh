metric="macro"
knowledge="none"
feature_metric="macro"
for seed in 42 0 1 2 3
do
  cmd="python train.py \
    --name rnn_emorynlp_${metric}_$seed \
    --model DialogueRNN \
    --dataset emorynlp \
    --batch_size 32 \
    --scheduler fixed \
    --lr 0.001 \
    --gradient_accumulation_steps 1 \
    --seed $seed \
    --metric $metric \
    --feature_metric $feature_metric \
    --epochs 60"
  echo "${cmd}"
  eval $cmd
done