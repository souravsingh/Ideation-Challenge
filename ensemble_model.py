
# Libraries
import numpy as np 
import pandas as pd
from sklearn import metrics
from sklearn.tree import DecisionTreeClassifier
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split
from sklearn.ensemble import AdaBoostClassifier, RandomForestClassifier, VotingClassifier
from sklearn.model_selection import cross_val_score
from sklearn.feature_selection import SelectKBest
from sklearn.feature_selection import chi2
from sklearn.feature_selection import f_regression, mutual_info_regression
import xgboost as xgb
    
# Import dataset
print 'Lading data ...'
nega1 = pd.read_csv('Dipep_negative.csv', header= None)
nega2 = pd.read_csv('AminoFreq_negative.csv', header= None)
nega = pd.concat([nega1, nega2], axis = 1)

posi1 = pd.read_csv('Dipep_positive219.csv', header= None)
posi2 = pd.read_csv('AminoFreq_positive219.csv', header= None)
posi = pd.concat([posi1, posi2], axis = 1)

nega_class = pd.DataFrame(np.zeros((len(nega))), columns=['class'])
posi_class = pd.DataFrame(np.ones((len(posi))), columns=['class'])
	
nega_data = pd.concat([nega, nega_class], axis= 1)
posi_data = pd.concat([posi, posi_class], axis= 1)

df = pd.concat([nega_data, posi_data])

# Target values
y = df['class']
del df['class']

# Select features according to the k highest scores
X_new = SelectKBest(chi2, k=10).fit_transform(df, y)

# AdaBoost classifier
clf1 = AdaBoostClassifier(DecisionTreeClassifier(max_depth=4),
				         algorithm="SAMME",
					 learning_rate = 0.01,
				         n_estimators=800)

# XGBoost classifier
clf2 = xgb.XGBClassifier(max_depth=5, learning_rate=0.01, min_child_weight=1, n_estimators=100)	

# Voting Classifier(Ensembling)
eclf1 = VotingClassifier(estimators=[('ad', clf1), ('xg', clf2)], voting='soft', weights=[4,6], flatten_transform=True)	

# 5 fold cross-validation
scores = cross_val_score(eclf1, X_new, y, cv=5)

# output
print 'score:',scores
avarage_acc = sum(scores)/len(scores)
print 'ava_score:',avarage_acc
