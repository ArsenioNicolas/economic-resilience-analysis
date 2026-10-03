Prepared By: Arsenio B. Nicolas Jr.

Date: September 2026

Tools: Python \| PostgreSQL \| Tableau Public

# **Executive Summary**

This analysis looks at 34 years of macroeconomic data over 215 economies
to capture trends in economic resilience, regional differences and
sensitivity to global economic shocks. This report highlights actionable
lessons for those in the investment, policy-making and economic research
communities looking to answer questions about which economies have
consistently outperformed, which are most at risk and how the COVID-19
crisis compares to the 2008 Global Financial Crisis in terms of economic
consequences and recovery.

# **Introduction**

## **Background**

> The world economy has dramatically changed in the last 30 years. The
> international economic landscape has been transformed by the fall of
> the Soviet Union, the emergence of Asian countries, the Global
> Financial crisis of 2008 and the unprecedented economic shock of
> COVID-19 pandemic. It is important to know how other economies have
> responded to these challenges, to inform institutional and policy
> decision-making.

## **Objectives**

> This analysis is used to identify answers to the following questions:

- Which economies have had the best growth of gross domestic product
  (GDP) over 34 years?

- What countries and regions have the greatest risk of economic
  instability?

- What are the similarities and differences between the COVID-19
  pandemic and the 2008 Financial Crisis in terms of economic
  consequences and recovery?

- How are inflation and GDP growth related in various economies?

- What are the macroeconomic most stable areas?

#  **Data & Methodology**

## **Data Sources**

  -------------------------------------------------------------------
       Indicator       Source               Coverage    Records
  -------------------- -------------------- ----------- -------------
   GDP Growth (annual  World Bank WDI       1960-2025   214 Economies
           %)                                           

  Inflation, Consumer  IMF World Economic   1980 --     196 Economies
   Prices (annual %)   Outlook              2029        

   Unemployment (% of  ILO Modelled         1991 - 2024 180+
   total labor force)  Estimates                        Economies
  -------------------------------------------------------------------

## **Data Processing**

> The raw data were downloaded in the wide format (with years as
> columns) and underwent the following processing:

- Extraction --- Downloaded ZIP archives from World Bank Open Data.

- Reshaping -- changing the wide format to long format in Python
  (Pandas) -- year columns to row observations.

- Sovereign economies was the only indicator of group that remained in
  the cleaning process. Only the indicator for sovereign economies
  remained in the cleaning process, after 49 regional and income-group
  aggregates were removed.

- The filtering was done to concentrate the analysis on a period of time
  with the most reliable data, 1990--2024.

- Integration --- Combined 3 indicators to one dataset of 7322
  observations in 215 countries

- Loading --- Data is stored in PostgreSQL for structured queries and
  analysis.

## **Analytical Approach**

> Ten structured SQL queries were created to cater to each business
> question systematically, ranging from aggregations, window functions,
> conditional logic, and cross-indicator comparisons. The results were
> then presented in an interactive Tableau Public dashboard.

# **Findings**

## **Global GDP Growth Leaders and Laggards**

> Top Performing Economies from 1990 -- 2024:

  ---------------------------------------------------------------
          Economy          Avg. Annual GDP Growth
  ------------------------ --------------------------------------
     Equatorial Guinea     14.69%

           Guyana          8.83%

           China           8.72%

          Myanmar          6.83%

          Ethiopia         6.76%
  ---------------------------------------------------------------

Worst Performing Economies from 1990 -- 2024:

  ---------------------------------------------------------------
          Economy          Avg. Annual GDP Growth
  ------------------------ --------------------------------------
        South Sudan        -4.93%

          Ukraine          -1.74%

         Venezuela         -0.79%

          Moldova          -0.02%
  ---------------------------------------------------------------

> **Key Insight:** Leading countries are mainly resource rich countries
> (Equatorial Guinea, Guyana) and Asian emerging markets (China,
> Myanmar, Vietnam) and the poor performers are predominantly countries
> with extended periods of political instability and conflict.

## **Regional Economic Performance**

  ------------------------------------------------------------------
        Region       Avg. GDP Growth         Avg. Inflation
  ------------------ ----------------------- -----------------------
         Asia        5.23%                   10.69%

        Africa       4.18%                   24.72%

     Middle East     3.93%                   11.64%

       Americas      3.62%                   37.40%

       Oceania       2.61%                   4.11%

        Europe       1.71%                   14.45%
  ------------------------------------------------------------------

> **Key Insight**: Asia has the highest average GDP growth rate, even
> though it is the economic most mature region in the world. The
> Americas region has the highest inflationary burden (9 times higher
> than the most stable region -- Oceania).

## **Inflation Analysis**

> Highest Average Inflation (1990 -- 2024):

  -----------------------------------------------------------------
             Economy            Avg. Annual Inflation
  ----------------------------- -----------------------------------
        Congo, Dem. Rep.        1,285.31%

             Angola             328.62%

             Brazil             245.41%

              Peru              233.04%

             Ukraine            201.29%
  -----------------------------------------------------------------

> **Key Insight:** There are differences within and between
> sub-situations of hyperinflation, most notably in terms of their
> geographical focus, with extreme hyperinflation occurring mainly in
> Sub-Saharan Africa and Latin America. Countries with negative GDP
> growth and high inflation rates are most severely affected by
> macroeconomic uncertainties: Ukraine, Argentina and Venezuela.

## **COVID-19 vs. 2008 Financial Crisis**

> Global Impact Comparison:

  ------------------------------------------------------------------
              Crisis             Global Avg. GDP Growth
  ------------------------------ -----------------------------------
       2008 Fincial Crisis       -2.1% (2009)

        COVID-19 Pandemic        -5.28% (2020)
  ------------------------------------------------------------------

> Most Affected Economies in 2020:

  ------------------------------------------------------------------
             Economy             GDP Growth 2020
  ------------------------------ -----------------------------------
            Macao SAR            -54.40%

             Maldives            -32.91%

              Libya              -29.46%

            Venezuela            -29.82%
  ------------------------------------------------------------------

> Fastest Recovering Economies in 2021:

  ------------------------------------------------------------------
             Economy             GDP Growth 2021
  ------------------------------ -----------------------------------
             Maldives            +37.515

         Turks and Caicos        +29.63%

              Libya              +28.30%

            Macao SAR            +22.46%
  ------------------------------------------------------------------

> **Key Insight:** In most economies, the impact of COVID-19 was much
> worse than the 2008 crisis. In 2020, tourism-dependent SIDs were hit
> particularly hard and in 2021 travel restrictions lifted, showing the
> strongest V-shaped recovery.

## **Economic Resilience Index**

- Between 1990 and 2024, 204 countries (95%) had at least one year of
  negative GDP growth.

- Economies are not invulnerable to economic shocks, even the best ones
  had recessions in 2008 or 2020.

- Resilience is not measured by how well people avoid bad times, but by
  how fast and how much they recover from them.

# **Recommendations**

> **For Investors**

- Look to Asian emerging markets for long-term growth portfolios --- the
  future growth prospects for long-term investment portfolios are best
  in China, Vietnam, Cambodia and India due to their improving
  macroeconomic stability.

- Be careful in countries with high inflation like Latin America and
  Sub-Saharan Africa where inflation reduces real returns.

> **For Policymakers**

- The typical tourism dependent economies need to urgently diversify
  their revenue base as the shock of COVID-19 has shown how critical it
  is for them to be single sector dependent.

- Stagflation is a situation in which growth slows down, and inflation
  continues to rise, and coordinated fiscal and monetary measures are
  needed to exit from this vicious cycle in countries facing
  stagflation.

- Establish sovereign wealth funds and economic buffers to prepare for
  future shocks in the global economy, including for SIDS

> **For International Organizations**

- Structural intervention in targeted conflict-affected economies (South
  Sudan, Ukraine, Venezuela) is needed, beyond monetary policy.

- Support inflation-targeting arrangements in the Americas and
  Sub-Saharan Africa to achieve long-term price stability.

#  **Limitations**

- Data is not complete for all indicators and countries, especially for
  early 1990s data of newly independent states that emerged after the
  breakup of the Soviet Union.

- Unemployment is less complete than GDP and inflation; analysis can be
  limited in depth for that indicator.

- Some of the classifications are simplified: 3,722 observations
  originate from smaller territories, which are combined in the category
  "Other"

- This analysis does not provide a causal link --- correlations of the
  indicators are observational

# **Conclusion**

> The macroeconomic record of the past 30 years is clear: all economies
> are susceptible to crisis, but how fast and strong the economy pulls
> through determines the long-term course of the economy.
>
> The continued success of Asia\'s GDP growth is not a coincidence;
> it\'s because of long-term policy choices and demographic dividends
> that have been deliberately pursued to achieve this. The transition
> from the early 1990s, when the Chinese economy grew at an average
> annual rate of 14%, to 6% growth in recent years is the most important
> economic event of the last 34 years.
>
> The COVID-19 pandemic has revealed the fragility of the
> tourism-dependent economies in a way the 2008 Financial crisis never
> has. In a single year a country such as Macao, with more than half of
> its GDP derived from gambling and tourism, has a loss of 54% of its
> GDP. Its recovery in 2021 is very impressive, but the takeaway is
> chilling: concentration equals vulnerability.
>
> The most surprising is that for the past 35 years, from 1990 to 2024,
> 95% of all economies had at least one year of negative growth. It is
> not just a problem in poor countries; economic decline is a universal
> reality. Rather than their ability to not experience downturns,
> resilient economies are distinguished by their institutional strength,
> policy flexibility, and economic diversity to rebound from them.
