SELECT *
FROM
  ML.PREDICT (MODEL `kaggle-lap.lap.training_dataset_logistic_reg_model`,
    (
    SELECT * EXCEPT(dataframe)
    FROM `kaggle-lap.lap.training_dataset_pp`
    WHERE
    dataframe = 'prediction'
    ),

    -- STRUCT 型で threshold (しきい値) を 0.5 として設定しています。
    STRUCT(0.5 as threshold)
  )
