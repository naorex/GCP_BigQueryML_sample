/*
まずはデータの前処理を行い、前処理を終えたデータをビューとして定義します。
「Loan_Status」列には、True (審査が通った) と False (審査に落ちた) の 2 つの値が入っており、
「Loan_Status」列と関連性のある属性を用いてモデルを構築します。
したがって、「Loan_ID」列は一意の値を持ち「Loan_Status」列とは関係がないため除外してます。
*/

CREATE OR REPLACE VIEW
`kaggle-lap.lap.training_dataset_pp` AS
SELECT * EXCEPT(Loan_ID),


-- トレーニングデータと予測データを分けるために、「dataframe」列を作成しています。
CASE
  WHEN MOD(ABS(FARM_FINGERPRINT(Loan_ID)), 10) < 8 THEN 'training'
  WHEN MOD(ABS(FARM_FINGERPRINT(Loan_ID)), 10) >= 8 THEN 'prediction'
END AS dataframe


-- 最後に、各列に null が含まれる行を除外しています。
FROM `kaggle-lap.lap.training_dataset`
WHERE
  Gender is not null
  AND Married is not null
  AND Dependents is not null
  AND Education is not null
  AND Self_Employed is not null
  AND ApplicantIncome is not null
  AND CoapplicantIncome is not null
  AND LoanAmount is not null
  AND Loan_Amount_Term is not null
  AND Credit_History is not null
  AND Property_Area is not null
  AND Loan_Status is not null
