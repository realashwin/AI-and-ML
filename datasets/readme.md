# MNIST Handwritten Digit Dataset

This repository contains the MNIST handwritten digit dataset organized into a structured format. The dataset is split into training and testing folders, with subfolders for each digit (0-9). Each subfolder contains PNG images of handwritten digits.
## Dataset Structure

The dataset is organized as follows:
- **train/**: Contains folders for training images, organized by digit.
- **test/**: Contains folders for testing images, organized by digit.

## Usage

You can download the dataset using Git:

## Loading Images
You can load images using libraries such as `PIL` or `OpenCV` in Python. Here's an example using `PIL`:

```python
from PIL import Image
import os

# Path to the dataset
train_dir = 'path/to/MNIST/train/'

# Load an image
image_path = os.path.join(train_dir, '0', 'image_1.png')
image = Image.open(image_path)
image.show()


```
## Contributing
If you would like to contribute to this dataset or report issues, feel free to open a pull request or issue on this repository.

## License
This dataset is provided for educational and research purposes. Please credit the original creators of the MNIST dataset if you use this data in your projects.

## Acknowledgements

The MNIST dataset is a well-known benchmark in the field of machine learning and is widely used for testing image processing systems. 

For more information on the original dataset, please visit <a href="http://yann.lecun.com/exdb/mnist/" target="_blank">Yann LeCun's website</a>.
