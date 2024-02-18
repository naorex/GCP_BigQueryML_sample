-- 「dataframe」列を元に、トレーニングデータと予測データの割合は以下のようになっています。

select count(*) as count
, countif(dataframe="training") as cnt_training
, countif(dataframe="prediction") as cnt_prediction
from lap.training_dataset_pp
