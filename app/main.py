import streamlit as st
from google.cloud import storage as gcs

st.title('sample')

st.write('aaaa')

bucket_name = 'test-streamlit-cloudrun-fuji-bucket'
project_id = "practice-docker"

# client = gcs.Client(project_id)
# bucket = client.get_bucket(bucket_name)
# blob = bucket.blob('dummy_movie.mp4')

# st.write(blob)
# file_byte = blob.download_as_bytes()

video_file = open('dummy_movie.mp4', 'rb')
file_byte = video_file.read()

st.video(file_byte)
# test
