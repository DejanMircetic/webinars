
# Preuzimanje slike sa http-a sa get nalogom i crtanje u R-u.
library(httr)
library(png)


url <- "https://3plcorporation.com/uploads/i0b5cg121010.png"
response <- GET(url)

if (status_code(response) == 200) {
  # Create a temporary file
  temp_file <- tempfile(fileext = ".png")
  # Write the content to the file
  writeBin(content(response, "raw"), temp_file)
  message("Image successfully downloaded to ", temp_file)
} else {
  stop("Failed to download the image. Status code: ", status_code(response))
}

if (file.exists(temp_file) && file.size(temp_file) > 0) {
  message("File exists and is not empty.")
} else {
  stop("Downloaded file is empty or does not exist.")
}

library(png)
img <- readPNG(temp_file)

# Check the dimensions of the image
dim(img)

# Optionally, view a small portion of the image data
print(img[1:10, 1:10, 1:3])

img_width <- dim(img)[2]
img_height <- dim(img)[1]

plot.new()
plot(as.raster(img), xlim = c(0, img_width), ylim = c(0, img_height), xaxt = 'n', yaxt = 'n', ann = FALSE)


# Sajt za igranje sa pozivima na API
# Slika sa drugog random web apija ponuðena u prf tutorijalu.