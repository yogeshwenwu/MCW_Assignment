from torchvision.io import decode_image
from torchvision.models import resnet50, ResNet50_Weights
from torchvision.io import read_file, decode_image

# Read image as a byte tensor first
img_bytes = read_file("./Dog_Breeds.jpg")

# Decode the image
img = decode_image(img_bytes)


# Step 1: Initialize model with the best available weights
weights = ResNet50_Weights.DEFAULT
model = resnet50(weights=weights)
model.eval()

# Step 2: Initialize the inference transforms
preprocess = weights.transforms()

# Step 3: Apply inference preprocessing transforms
batch = preprocess(img).unsqueeze(0)

# Step 4: Use the model and print the predicted category
prediction = model(batch).squeeze(0).softmax(0)
class_id = prediction.argmax().item()
score = prediction[class_id].item()
category_name = weights.meta["categories"][class_id]
print(f"{category_name}: {100 * score:.1f}%")