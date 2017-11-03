# Ideation Challenge Code Repository

The repository contains the code and the data related to the Ideation Challenge, which is a part of the [Inbix 2017: Indian Conference on Bioinformatics](http://bioclues.org/inbix17/). The competition aims to create a Machine Learning algorithm which can provide a better accuracy than the algorithms used by the server [here](http://caps.ncbs.res.in/3dswap-pred/) used for predicting the peptides eligible for 3d domain swapping of peptide sequence.

## Background behind the challenge

3D domain swapping is a mechanism by which two or more peptide chain combine together to form a dimer or an oligomer by exchanging an identical structural element. Many factors like low pH, temperature or certain solvents can lead to 3D domain swapping among peptide chains. 

The challenge aims to find an algorithm which can make use of biologically relevant features and report a higher accuracy than the approaches used for the 3dswapping server like SVM and Random Forests.


# Running the code

The preprocessed dataset in FASTA format is stored in the ``data/`` directory along with the amino acid frequency and dipeptide frequency dataset is stored in the ``data/`` directory.

The Perl programs used to compute the amino acid frequency and dipeptide frequency is stored in the ``utils\`` directory.

To run the Machine Learning model, first install the necessary requirements for the program using-

```
pip install -r requirements.txt
```

Once done, You can now run the model contained in ``ensemble_model.py`` using- `` python ensemble_model.py`` 
