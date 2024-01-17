FROM python

WORKDIR /app

COPY src/ /app/

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

# CMD ["python3", "app.py"]

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
     
