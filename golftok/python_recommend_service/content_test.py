import pandas as pd
import numpy as np
from scipy.sparse.linalg import svds

def recommend_posts(df_svd_preds, user_id, ori_posts_df, ori_likes_df, num_recommendations=5):
    user_row_number = user_id - 1

    sorted_user_predictions = df_svd_preds.iloc[user_row_number].sort_values(ascending=False)

    user_data = ori_likes_df[ori_likes_df.user_id == user_id]

    user_history = user_data.merge(ori_posts_df, on='post_id').sort_values(['rating'], ascending=False)

    recommendations = ori_posts_df[~ori_posts_df['post_id'].isin(user_history['post_id'])]
    recommendations = recommendations.merge(pd.DataFrame(sorted_user_predictions).reset_index(), on='post_id')

    # 결과를 유사도 기준으로 정렬
    recommendations = recommendations.rename(columns={38: 'predictions'}).sort_values('predictions', ascending=False)

    return user_history, recommendations


df_likes = pd.read_csv('C:/Users/owner/PycharmProjects/golftok/like_data.csv')
df_posts = pd.read_csv('C:/Users/owner/PycharmProjects/golftok/post_data.csv')

df_like_post_ratings = df_likes.pivot(
    index='user_id', columns='post_id', values='rating'
).fillna(0)

matrix = df_like_post_ratings.to_numpy()

post_ratings_mean = np.mean(matrix, axis=1)

matrix_post_mean = matrix - post_ratings_mean.reshape(-1, 1)

U, S, V = svds(matrix_post_mean, k=5)
S = np.diag(S)

svd_user_predicted_ratings = np.dot(np.dot(U, S), V) + post_ratings_mean.reshape(-1, 1)
df_svd_preds = pd.DataFrame(svd_user_predicted_ratings, columns=df_like_post_ratings.columns)

already_rated, predictions = recommend_posts(df_svd_preds, 39, df_posts, df_likes, 10)
#print("already_rated:", already_rated)
#pd.set_option('display.max_columns', None)
#pd.set_option('display.max_rows', None)

predictions = predictions.loc[:,['post_id']]
print("predictions:", predictions)
#print(predictions.sample(n=len(predictions)))
#predictions.to_json("post_predictions.json",orient='table')