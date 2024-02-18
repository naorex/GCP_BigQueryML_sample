-- 先程予測に用いたデータには正解のラベルもあるので、予測データに対して評価も行ってみます。

SELECT *
FROM
ML.EVALUATE (MODEL `kaggle-lap.lap.training_dataset_logistic_reg_model`,
  (
  SELECT *
  FROM `kaggle-lap.lap.training_dataset_pp`
  WHERE
    dataframe = 'prediction'
  ),
  STRUCT(0.5 as threshold)
)
