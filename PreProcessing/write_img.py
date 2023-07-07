import cv2
import numpy as np


# Load images in GrayScale
referenceImg = cv2.imread('reference.jpg', cv2.IMREAD_GRAYSCALE)

print(type(referenceImg))
# Open text file to store pixel values
referenceFile = open('test.txt', 'r+')

# # Convert NumpY array to type int for easier manipulation
referenceImage = referenceImg.astype(int)

# Save Data to file
np.savetxt(referenceFile, referenceImage, fmt='%d')

# Close file
referenceFile.close()

# Repeat the same steps for the forward frame
forwardImg = cv2.imread('forward.jpg', cv2.IMREAD_GRAYSCALE)
forwardFile = open('forward.txt', 'r+')
forwardImg = forwardImg.astype(int)
np.savetxt(forwardFile, forwardImg, fmt="%d")
forwardFile.close()


