import tensorflow as tf
import numpy as np
import cv2
from tensorflow.keras.applications.mobilenet_v2 import MobileNetV2, preprocess_input, decode_predictions

# Force TensorFlow to use CPU only
import os
os.environ['CUDA_VISIBLE_DEVICES'] = '-1'

def load_model():
    model = MobileNetV2(weights='imagenet')
    return model

def preprocess_image(image_path):
    image = cv2.imread(image_path)
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    image = cv2.resize(image, (224, 224))  # MobileNetV2 input size
    image = preprocess_input(image)  # Normalize image
    image = np.expand_dims(image, axis=0)  # Add batch dimension
    return image

def predict_image(model, image_path):
    image = preprocess_image(image_path)
    predictions = model.predict(image)
    decoded_predictions = decode_predictions(predictions, top=3)[0] 
    return decoded_predictions

if __name__ == "__main__":
    model = load_model()
    image_path = "/mnt/mydisk/yogesh/MCW_Assignment/Img_Clf_tf/cute-cat-tilting-head-baby-600nw-2492403467.jpg"  
    predictions = predict_image(model, image_path)
    
    print("Top Predictions:")
    for i, (imagenet_id, label, score) in enumerate(predictions):
        print(f"{i+1}: {label} ({score * 100:.2f}%)")

