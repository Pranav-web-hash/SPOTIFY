# Spotify Data Cleaning & Analysis Project (SQL)

## 📌 Project Overview
This project focuses on cleaning and analyzing the **Spotify 2023 dataset** using MySQL.  
The goal is to demonstrate practical **data cleaning, transformation, and analysis** skills commonly used in data analyst roles.  

The project covers:  
- Data Cleaning (handling missing values, duplicates, standardization, consistency checks)  
- Descriptive Statistics  
- Trend Analysis (yearly & monthly trends)  
- Popular Insights (most streamed tracks & playlists)  
- Feature Relationships (impact of danceability, energy, etc. on streams)  

---

## 🗂 Dataset
The dataset used: **Spotify 2023 (reduced for SQL performance)**  
- Columns include:  
  `track_name, released_year, released_month, in_spotify_playlists, in_spotify_charts, streams, bpm, danceability, energy, speechiness, acousticness, instrumentalness, liveness, valence`

---

## 🧹 Data Cleaning Steps
1. **Added Unique ID** – for easy duplicate removal.  
2. **Handled Missing Values** – checked and reported null counts.  
3. **Removed Duplicates** – compared rows and deleted duplicate entries.  
4. **Standardized Text** – converted track names to lowercase.  
5. **Checked Numeric Ranges** – validated `bpm, danceability, energy` ranges.  
6. **Detected Outliers** – checked min/max values for streams and bpm.  
7. **Format Consistency** – ensured released year and month are in valid ranges.  

---

## 📊 Descriptive Statistics
- Total songs in dataset.  
- Average streams, bpm, and danceability.  
- Latest release year.  

---

## 📈 Trend Analysis
- **Streams by Year** → to identify growth patterns in music consumption.  
- **Streams by Month** → to see seasonal/periodic streaming trends.  

---

## 🔥 Popular Insights
- Track with the highest playlist appearances.  
- Top 10 most popular songs.  

---

## 🎵 Feature Relationships
- **Danceability vs Streams** – Do danceable songs get more streams?  
- **Energy vs Streams** – Are energetic tracks streamed more?  
- Other features (speechiness, acousticness, etc.) can also be extended.  

---

## 🛠️ Tools Used
- **MySQL Workbench** – Data cleaning & SQL analysis.  
- **Excel/CSV** – Initial dataset format.  
- *(Optional future work: Tableau/Power BI for visualization)*  

---

## 📌 Future Improvements
- Add **visualizations** for trends & feature relationships.  
- Compare **explicit vs non-explicit songs**.  
- Analyze **artist-level popularity**.  
- Build a **predictive model** for top songs.  

---

## 📑 Files in Repository
- `spotify_project.sql` → All SQL queries used.  
- `spotify_reduced.csv` → Reduced dataset for SQL.  
- `README.md` → Project documentation.  

---

## 🚀 Conclusion
This project demonstrates the **end-to-end process of cleaning, analyzing, and deriving insights** from real-world music data using SQL. It replicates tasks expected from a **junior data analyst role** and can be further extended with visualizations and advanced analytics.  
