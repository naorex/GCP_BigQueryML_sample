-- 最後に、特徴量の重要度スコアを見てみましょう。
-- 特徴量の重要度スコアとは、各特徴量がどれほど影響を及ぼしているか数値化されています。

SELECT *,
  ROUND(attribution *100 / (
    SELECT
      SUM(attribution)
    FROM
      ML.GLOBAL_EXPLAIN(MODEL `kaggle-lap.lap.training_dataset_logistic_reg_model`)
  ), 1) AS percentage
FROM
 ML.GLOBAL_EXPLAIN(MODEL `kaggle-lap.lap.training_dataset_logistic_reg_model`)
