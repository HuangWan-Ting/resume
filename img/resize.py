import cv2

img = cv2.imread('finalImg2.png')

img = cv2.resize(img, (600, 400), interpolation=cv2.INTER_CUBIC)

cv2.imwrite('finalImg2.png',img)