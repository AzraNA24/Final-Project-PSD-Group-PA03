from PIL import Image

# Path to the input data file
input_file = "output_pixels.txt"
output_file = "output.bmp"

# Read data from the text file
with open(input_file, "r") as f:
    # Convert each line to a list of integers
    pixels = [[int(num) for num in line.split()] for line in f]

# Get the image dimensions
height = len(pixels)
width = len(pixels[0])

# Create a new grayscale image ('L' mode) with the specified dimensions
img = Image.new('L', (width, height))

# Flatten the 2D list and set the pixel values (255 for white, 0 for black)
img.putdata([255 if pixel == 1 else 0 for row in pixels for pixel in row])

# Save the image as BMP
img.save(output_file)
print(f"BMP image saved as '{output_file}'")
