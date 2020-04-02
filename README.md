# Project: Can you recognize the emotion from an image of a face? 
<img src="figs/CE.jpg" alt="Compound Emotions" width="500"/>
(Image source: https://www.pnas.org/content/111/15/E1454)

### [Full Project Description](doc/project3_desc.md)

Term: Spring 2020

+ Team # 3
+ Team members
	+ Du, Jinxiao (Presenter)
	+ Duong, Tram
	+ Liu, Ziyun
	+ Lu, Ran
	+ Su, Kexin(Colleen)

+ **Project summary**: 
In this project, we created a classification engine for facial emotion recognition.
We developed advanced classification models to compare their accuracy and efficiency to the client's original baseline model -- Boosted Decision Stumps(gbm), which has a model accuracy of 44.4\%. The advanced model we tried are KNN, Support Vector Machine(SVM), CNN, and Random Forest. Among the 4 advanced models, SVM has the highest accuracy, which is around 52.8\%, so we chose SVM as our final advanced model.  We also conducted PCA for our feature selection.  

* All of the code for models that we tried but did not work out are included at the end of the Rmarkdown file as an appendix, and are not included in the final pdf.
	
+**Contribution statement**:  All team members contributed equally in all stages of this project. 

	+ Jinxiao Du wrote out the code for CNN model in Python, and converted it into R.
	+ Tram  Duong wrote the code for SVM and Random Forest, and conducted cross validation for both models. 
	+ Ziyun Liu and Kexin Su collaboratively wrote the code for KNN, and Ziyun also conducted feature selection for advanced model using PCA.
	+ Ran Lu wrote the code for the complete baseline model.
	+ Kexin Su worked on the code for KNN with Ziyun Liu, merged all the models into the main R markdown file, wrote the code for the label_prediction.csv, and write up the README file.
	
All team members approve our work presented in this GitHub repository including this contributions statement. 

Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.
