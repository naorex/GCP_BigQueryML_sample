-- モデル構築を行います。

CREATE OR REPLACE MODEL
`kaggle-lap.lap.training_dataset_logistic_reg_model`
OPTIONS
(
  /*
  model_type には [LOGISTIC_REG] (ロジスティック回帰モデル) を選択します。
  デフォルトでは、ロジスティック回帰モデルの作成に使用されるトレーニングデータは重み付けされていないため、
  auto_class_weights を True に設定することでラベルに偏りが出てもバランスを取ってくれます。
  */

  model_type='LOGISTIC_REG',
  auto_class_weights=TRUE,

  /*
  data_split_method はトレーニングデータと評価データでデータを分けることができますが、
  今回は「dataframe」列を追加しデータ分割をしているため、明示的に不要としています。
  */

  data_split_method='NO_SPLIT',

  /*
  enable_global_explain はモデルに対するグローバルな特徴の重要性を評価するために必要です。
  本検証の最後に使用するため True にしておきます。
  */

  enable_global_explain=TRUE,

  -- input_label_cols はトレーニングデータのラベル列名となるため、今回は「Loan_Status」を記入します。
  input_label_cols=['Loan_Status']

  ) AS

SELECT
* EXCEPT(dataframe)
FROM
`kaggle-lap.lap.training_dataset_pp`
WHERE
dataframe = 'training'
