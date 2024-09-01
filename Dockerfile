FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app/book_catalog

# Copy the requirements file into the container
COPY book_catalog/requirements.txt .

# Install the project dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project files into the container
COPY book_catalog/ .

# Set environment variables (replace these with actual values or use secrets)
ENV PYTHONUNBUFFERED=1
ENV DATABASE_URL=postgresql://task_6_2p_user:QyPydHYu8duzbz6itTDM7hjNLOWkU48P@dpg-cr9aald6l47c73cjp0a0-a.oregon-postgres.render.com/task_6_2p

# Expose the port the app runs on
EXPOSE 8000

# Run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
