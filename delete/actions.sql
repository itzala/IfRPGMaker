DELETE FROM ActiKey WHERE keyword = "keyword" 
DELETE FROM ActiKey WHERE action = "action"
DELETE FROM ActiKey WHERE action = "action", keyword = "keyword"

DELETE FROM Actions WHERE action = "action"

DELETE FROM Keywords WHERE keyword = "keyword" 

DELETE FROM Dictionnaire WHERE synonym = "synonym"
DELETE FROM Dictionnaire WHERE synonym = "synonym", keyword = "keyword"
