metric="macro"
knowledge="U_and_F"
for seed in 42 0 1 2 3
do
  cmd="python train.py \
    --name base_emorynlp_UF_${metric}_$seed \
    --model BaseModel \
    --dataset emorynlp \
    --batch_size 6 \
    --gradient_accumulation_steps 4 \
    --seed $seed \
    --metric $metric \
    --scheduler cosine \
    --lr 0.00001 \
    --plm_lr 2e-6 \
    --n_sentences 3 \
    --feature_metric macro \
    --epochs 30 \
    --knowledge $knowledge"
  echo "${cmd}"
  eval $cmd
done