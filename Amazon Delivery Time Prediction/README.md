# 🚀 Amazon Delivery Time Prediction using Machine Learning

## 📌 Objective
To build a **predictive model** that accurately estimates Amazon delivery times based on multiple operational and environmental factors such as distance, traffic, weather, and vehicle type — enabling improved logistics efficiency and customer satisfaction.

---

## 🧠 Project Overview
This project focuses on analyzing Amazon delivery data to identify key factors affecting delivery performance and to develop a machine learning model that predicts delivery time with high accuracy.  
Through data preprocessing, feature engineering, and advanced modeling, the project aims to optimize resource allocation and delivery planning.

---

## ⚙️ Workflow
1. **Data Cleaning & Preprocessing**
   - Handled missing values, encoded categorical variables, and scaled numerical data.  
2. **Feature Engineering**
   - Derived features such as delivery distance, delivery speed, time of day, and traffic impact.  
3. **Exploratory Data Analysis (EDA)**
   - Visualized trends across traffic, weather, vehicle type, and product category.  
4. **Model Building**
   - Tested multiple models: `Linear Regression`, `Ridge`, `Lasso`, `Random Forest`, and `XGBoost`.  
5. **Model Evaluation**
   - Compared models based on R², MAE, and RMSE metrics.  
   - **XGBoost achieved R² = 0.89** and **MAE < 2 minutes**.  

---

## 📊 Key Insights from EDA

### 1. Average Delivery Speed by Traffic Condition
- Deliveries during **low traffic** conditions recorded the **highest speed**.  
- Heavy traffic and jams significantly slowed delivery times.

![Traffic Condition](images/traffic_condition.png)

---

### 2. Average Delivery Speed by Weather
- **Sunny weather** had the fastest average speeds.  
- **Stormy** and **foggy** days saw slower deliveries due to reduced visibility and safety precautions.

![Weather Conditions](images/weather_conditions.png)

---

### 3. Average Delivery Time by Product Category
- **Grocery items** had the longest delivery times due to perishable handling and frequent local routing.  
- **Electronics** and **clothing** categories were among the fastest.

![Product Category](images/product_category.png)

---

### 4. Average Delivery Time by Vehicle Type
- **Vans** had the **highest delivery speed**, benefiting from route optimization and larger capacity.  
- **Motorcycles and scooters** were slower but suitable for short-distance deliveries.

![Vehicle Type](images/vehicle_type.png)

---

### 5. Average Delivery Speed Across Time of Day
- Deliveries made at **night (0–6 hrs)** were fastest due to minimal traffic.  
- **Morning** deliveries were comparatively slower.

![Time of Day](images/time_of_day.png)

---

### 6. Delivery Distance vs Speed
- A mild positive correlation was observed — longer distances resulted in slightly higher speeds, likely due to highway routes.

![Distance vs Speed](images/distance_vs_speed.png)

---

## 🧮 Model Performance

| Model                | R² Score | MAE (minutes) | RMSE |
|----------------------|-----------|----------------|------|
| Linear Regression    | 0.72      | 4.1            | 5.2  |
| Ridge Regression     | 0.74      | 3.8            | 4.9  |
| Lasso Regression     | 0.73      | 3.9            | 5.0  |
| Random Forest        | 0.85      | 2.6            | 3.3  |
| **XGBoost Regressor**| **0.89**  | **1.9**        | **2.8** |

---

## 🧩 Skills & Tools Used
**Languages:** Python  
**Libraries:** Pandas, NumPy, Scikit-learn, XGBoost, Matplotlib, Seaborn  
**Concepts:** Regression Modeling, Feature Engineering, EDA, Model Evaluation, Visualization  

---

## 🏁 Outcome
✅ Built a high-performing **delivery time prediction model** with 89% accuracy.  
✅ Extracted actionable insights to optimize **routes, scheduling, and resource utilization**.  
✅ Demonstrated the potential of **data-driven decision-making** in improving e-commerce logistics efficiency.

---

## 💡 Future Scope
- Integrate **real-time traffic and weather APIs** for live prediction updates.  
- Deploy the model using **Flask or Streamlit** for user-friendly interaction.  
- Apply **time-series forecasting** for delivery trend prediction.

---

## 📂 Repository Structure
