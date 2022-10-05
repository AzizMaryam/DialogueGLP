metric="weighted"
knowledge="none"
feature_metric="weighted"
for seed in 42 0 1 2 3
do
  cmd="python train.py \
    --name infer_meld_cls3_${metric}_$seed \
    --model DialogueInfer \
    --dataset meld \
    --batch_size 16 \
    --scheduler fixed \
    --lr 0.0005 \
    --gradient_accumulation_steps 1 \
    --seed $seed \
    --metric $metric \
    --feature_metric $feature_metric \
    --cls_3 \
    --epochs 60"
  echo "${cmd}"
  eval $cmd
done