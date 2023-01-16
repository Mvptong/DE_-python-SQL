
#read text file from CLI
data = input("Enter unsanitized text:   ")
tab_count = data.count("\t")
alphabet_count = sum(1 for c in data if c.isupper())
sanitized_text = data.lower().replace("\t","____")
print("The output of sanitized text is ",sanitized_text, "  |||    Tab was replaced with underscore", tab_count, "times and uppercase was replaced with lower", alphabet_count, "times") 



#extensible code
#read text file in local

with open(r"localfilepath\wordfilename.txt") as data:
    data = data.read()
    tab_count = data.count("\t")
    alphabet_count = sum(1 for c in data if c.isupper())
    sanitized_text = data.lower().replace("\t","____")
    print("The output of sanitized text is ",sanitized_text, "  |||    Tab was replaced with underscore", tab_count, "times and uppercase was replaced with lower", alphabet_count, "times") 

#read text file from database 
from google.cloud import storage
storage_client = storage.Client()
bucket = storage_client.bucket(bucket_name)
blob = bucket.blob(blob_name)
data = blob.open("r")
tab_count = data.count("\t")
alphabet_count = sum(1 for c in data if c.isupper())
sanitized_text = data.lower().replace("\t","____")
print("The output of sanitized text is ",sanitized_text, "  |||    Tab was replaced with underscore", tab_count, "times and uppercase was replaced with lower", alphabet_count, "times") 


""" To make this project as PROD-ready we must define this code as Function and write function in DAG file and call function via 
PythonOperator which import from airflow.operators.python and upload DAG file to airflow 
"""