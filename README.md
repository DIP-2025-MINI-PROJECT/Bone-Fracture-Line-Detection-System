# Bone-Fracture-Line-Detection-System
Matlab code for bone fracture detection in x rays

# Project Name: Bone Fracture Line Detection System

### Project Description:
#### Summary - 
We have attempted to develop a Fracture Line Detection System using MATLAB and its Image Processing 
Toolbox. The system aims to assist radiologists by processing X-ray images to automatically highlight potential bone fractures. The methodology involves Image Enhancement, Edge Detection and Segmentation. The core of the algorithm isolates internal fracture lines by logically subtracting the external bone perimeter 
(derived from the mask) from the complete set of Canny edges. The system successfully processes an X-ray, cleans the resulting candidates, and overlays the final detected fracture line in red on the original image, providing a clear visual aid for diagnosis. 

#### Course concepts used - 
1. Grayscale conversion
2. Image Enhancement
3. Dilation
4. Edge detection
5. Opening

   
#### Additional concepts used -
1. Anisotropic Diffusion
2. Contrast Adjustment
3. Seeded region growing
   
#### Dataset - 
[1] “Simple oblique or spiral tibial fracture,” Aofoundation.org, 
https://surgeryreference.aofoundation.org/orthopedic-trauma/pediatric-trauma/tibial-shaft/tibia-simpleoblique-or-spiral/definition#x-ray 

[2] B. M. Rafi and V. Tiwari, “[Figure, An x-ray of right forearm showing isolated ulna fracture Contributed by Vivek Tiwari],”www.ncbi.nlm.nih.gov,Aug.https://www.ncbi.nlm.nih.gov/books/NBK574580/figure/article-137044.image.f3/ 08,2023. 

#### Novelty - 
1. Hybrid Spatial Subtraction technique combining region-based and edge-based segmentation.

2. Dynamic exclusion mask generated from Region Growing of the bone and its morphological boundary.

3. Logical subtraction of the bone’s external contour from the global edge map to isolate true fracture lines.

4. Automatic separation of pathological internal discontinuities from healthy anatomical edges—beyond what standard edge detectors can achieve alone.

5. Anisotropic Diffusion preprocessing preserves fracture-relevant edges while suppressing X-ray noise.

6. Pure classical digital image processing pipeline. No deep learning or black-box models involved.

7. Fully implemented in MATLAB, ensuring reproducibility, transparency, and ease of modification.

   
### Contributors:
1. Shreya Rose Jimson (PES1UG23EC289)
2. Aryan Deshpande (PES1UG23EC059)

### Steps:
1. Clone Repository
```git clone https://github.com/Digital-Image-Processing-PES-ECE/project-name.git ```

2. Install Dependencies
Install image processing toolbox on Matlab

3. Run the Code on matlab

### Outputs:
<img width="875" height="511" alt="image" src="https://github.com/user-attachments/assets/3ef1d519-c667-4af9-a2e8-350b377289b5" />
<img width="782" height="482" alt="image" src="https://github.com/user-attachments/assets/5494d258-94e5-4bf4-a629-549dd14f968a" />


### References:
[1] 
“Image Processing Toolbox Documentation,” Mathworks.com, 2025. https://in.mathworks.com/help/images/index.html (accessed Nov. 16, 2025). 

[2] 
Dynamsoft, “Image Processing 101 Chapter 2.2: Image Enhancement,” Dynamsoft Document Imaging Blog, Jun. 10, 2021. https://www.dynamsoft.com/blog/insights/image-processing/image-processing-101-imageenhancement/ 

[3] 
N. Srivastava, “Diffusion based Image filtering,” E2enetworks.com, Sep. https://www.e2enetworks.com/blog/diffusion-based-image-filtering (accessed Nov. 16, 2025).

[4] 
05, 2022. T. Malche, “Edge Detection in Image Processing: An Introduction,” Roboflow Blog, Jun. 14, 2024. https://blog.roboflow.com/edge-detection/ 

[5] 
“ROHINI COLLEGE OF ENGINEERING & TECHNOLOGY EC8093-DIGITAL IMAGE PROCESSING Region Growing Segmentation.” Available: https://www.rcet.org.in/uploads/academics/rohini_48305134656.pdf 

[6] 
R. C. Gonzalez and R. E. Woods, Digital image processing, 4th ed. New York, NY: Pearson, 2018. 

[7] 
“Simple oblique or spiral tibial fracture,” Aofoundation.org, https://surgeryreference.aofoundation.org/orthopedic-trauma/pediatric-trauma/tibial-shaft/tibia-simple
oblique-or-spiral/definition#x-ray (accessed Nov. 16, 2025). 2025. 

[8] 
B. M. Rafi and V. Tiwari, “[Figure, An x-ray of right forearm showing isolated ulna fracture Contributed by Vivek Tiwari],” www.ncbi.nlm.nih.gov, Aug. 
https://www.ncbi.nlm.nih.gov/books/NBK574580/figure/article-137044.image.f3/ 08, 2023. 
   
### Limitations and Future Work:
Although the fracture-detection algorithm produces a functional demonstration of 
classical image-processing techniques, it also contains several important limitations 
that affect its accuracy, robustness, and suitability for real clinical use. Many steps in 
the pipeline rely on manual input or fixed parameters, making the method sensitive to 
user choices and imaging conditions. In addition, the underlying edge-based approach 
struggles with real-world X-ray variability, complex anatomical structures, and subtle 
fractures that do not produce strong visual cues. The following limitations outline the 
key challenges and constraints of the current implementation. 
1. Requires Manual Intervention: 
The region-growing step requires the user to manually click a seed point inside 
the bone 
In our initial draft of the code we had tried just assuming the center of the image 
x/2, y/2. However this gave us grossly inaccurate results. This is because not all 
xrays are centered about the mid point. This manual selection gives us a better 
performance, but still is not perfect. 
2.  Highly Sensitive to Parameter Tuning: 
Many stages depend on manually chosen values. Different X-rays require 
different thresholds; there is no adaptive control. All the parameters used are 
assumptions, we have not used deep learning algorithms. The algorithm does not 
generalize across patients, bones, or imaging conditions. 
3. Here, we have highly simplified the fracture detection. 
The core logic:
fracture = edges − bone outline 
This assumes fractures produce internal linear edges. However, many edges 
inside bone are normal trabecular patterns which leads to false positives. Smooth 
cortex fractures (non-displaced) produce weak edges which leads to false 
negatives. Bone curvature or irregular shape can be misinterpreted as fractures. 
4. No Machine Learning / Deep Learning 
The code is entirely classical image processing, which is not robust to variations 
in anatomy, pose, or image quality. It is unable to learn fracture patterns. Also, 
it is not capable of detecting subtle, hairline fractures. Modern fracture detection 
uses CNNs and Vision Transformers. 

