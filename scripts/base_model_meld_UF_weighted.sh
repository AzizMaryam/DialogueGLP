metric="weighted"
knowledge="U_and_F"
for seed in 42 0 1 2 3
do
  cmd="python train.py \
    --name base_meld_UF_${metric}_$seed \
    --model BaseModel \
    --dataset meld \
    --batch_size 6 \
    --gradient_accumulation_steps 4 \
    --seed $seed \
    --metric $metric \
    --scheduler cosine \
    --lr 0.00001 \
    --plm_lr 5e-6 \
    --feature_metric weighted \
    --epochs 16 \
    --knowledge $knowledge"
  echo "${cmd}"
  eval $cmd
done