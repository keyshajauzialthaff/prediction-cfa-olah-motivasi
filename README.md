# prediction-cfa-olah-motivasi

# Prediction Configural Frequency Analysis (P-CFA) for Motivation Data

Repositori ini berisi analisis konfigurasi frekuensi prediktif (**Prediction Configural Frequency Analysis / P-CFA**) menggunakan R untuk mengidentifikasi pola hubungan (*Types* dan *Antitypes*) antara variabel demografi/latar belakang dengan tingkat **Skala Dorongan/Motivasi Individu (SDI)** pada data kepolisian.

---

## Overview Project & Variabel Penelitian

Analisis ini melibatkan 4 variabel kategorik yang membentuk **32 konfigurasi** struktur data multidimensi:
1. **Usia** (Prediktor): Kategori 1 (18-25 Tahun), Kategori 2 (>25 Tahun)
2. **Pend / Pendidikan** (Prediktor): Kategori 1 (SLTA), Kategori 2 (Diploma/Sarjana/Master)
3. **Satdik / Satuan Pendidikan** (Prediktor): Pusdik Reserse (1), Pusdik Brimob (2), Prolat (3), Sepolwan (4)
4. **SDI / Skala Dorongan Individu** (Kriteria): Transaksional (1) dan Otonom Tinggi (2)

---

## Pemodelan & Metodologi

Penelitian ini membandingkan dua pendekatan model dalam P-CFA:
* **Model 1 (Independensi Penuh / Complete Independence)**: Mengasumsikan tidak ada interaksi antar variabel prediktor (`~ Usia + Pend + Satdik + SDI`).
* **Model 2 (Independensi Bersyarat / Conditional Independence)**: Memperhitungkan hubungan antar variabel prediktor (`~ Usia * Pend * Satdik + SDI`).

Uji lokal menggunakan koreksi **Bonferroni ($\alpha = 0.0015625$)** untuk mengontrol *Type I Error*.

---

## 📈 Ringkasan Perbandingan Model (Information Criteria)

Berdasarkan evaluasi kriteria informasi, **Model 2** menunjukkan kecocokan (*goodness of fit*) yang jauh lebih baik dibandingkan Model 1 karena menghasilkan nilai *Log-Likelihood* yang lebih tinggi serta AIC dan BIC yang lebih rendah:

| Indikator | Model 1 (Complete Independence) | Model 2 (Conditional Independence) |
| :--- | :--- | :--- |
| **LogLik** | -1001,888 | -454,741 |
| **AIC** | 2017,776 | 943,482 |
| **BIC** | 2028,036 | 968,3995 |

---

## 📁 Struktur File di Repositori

```bash
.
├── Olah Motivasi 2.xlsx                 # Dataset penelitian
├── Olah Motivasi Pak Nusar.R            # Script analisis R lengkap
├── HASIL PENGERJAAN OLAH DATA P-CFA.pdf # Laporan lengkap hasil pengerjaan & interpretasi
└── README.md                            # Dokumentasi repository
