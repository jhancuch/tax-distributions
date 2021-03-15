
library(shiny)
library(ggplot2)
library(readxl)

# Load Data
    
    # TY2015 dataset
      dat2015 <- readxl::read_xlsx("data/Distribution-of-tax-burden-2015.xlsx", sheet = "percent distribution step")
      names(dat2015) <- c("Adjusted Tax Unit Income Decile", "Number of Tax Units", "Number of Individuals", "Tax Unit Income", "Total Federal Taxes",
                            "Individual Income Taxes", "Corporate Income Taxes", "Payroll Taxes", "Excise and Customs Duties", "Estate and Gift Taxes")
        
    # TY2016 dataset
        dat2016 <- readxl::read_xlsx("data/Distribution-of-tax-burden-2016.xlsx", sheet = "percent distribution step")
        names(dat2016) <- c("Adjusted Tax Unit Income Decile", "Number of Tax Units", "Number of Individuals", "Tax Unit Income", "Total Federal Taxes",
                            "Individual Income Taxes", "Corporate Income Taxes", "Payroll Taxes", "Excise and Customs Duties", "Estate and Gift Taxes")
        
    # TY2017 dataset
        dat2017 <- readxl::read_xlsx("data/Distribution-of-tax-burden-2017.xlsx", sheet = "percent distribution step")
        names(dat2017) <- c("Adjusted Tax Unit Income Decile", "Number of Tax Units", "Number of Individuals", "Tax Unit Income", "Total Federal Taxes",
                            "Individual Income Taxes", "Corporate Income Taxes", "Payroll Taxes", "Excise and Customs Duties", "Estate and Gift Taxes")
        
    # TY2018 dataset
        dat2018 <- readxl::read_xlsx("data/Distribution-of-tax-burden-2018.xlsx", sheet = "percent distribution step")
        names(dat2018) <- c("Adjusted Tax Unit Income Decile", "Number of Tax Units", "Number of Individuals", "Tax Unit Income", "Total Federal Taxes",
                            "Individual Income Taxes", "Corporate Income Taxes", "Payroll Taxes", "Excise and Customs Duties", "Estate and Gift Taxes")
        
    # TY2019 dataset
        dat2019 <- readxl::read_xlsx("data/Distribution-of-tax-burden-2019.xlsx", sheet = "percent distribution step")
        names(dat2019) <- c("Adjusted Tax Unit Income Decile", "Number of Tax Units", "Number of Individuals", "Tax Unit Income", "Total Federal Taxes",
                            "Individual Income Taxes", "Corporate Income Taxes", "Payroll Taxes", "Excise and Customs Duties", "Estate and Gift Taxes")


        
# create shiny app

ui <- fluidPage(
  
  navbarPage("U.S. Tax Burden and Income Distributions",
             
      tabPanel("Introduction", fluid = TRUE,
                
          tags$h2("Interactive Plotting of the Distribution of Tax Unit Income and Tax Burdens"),
          tags$p("The ", em("Plotting Within Tax Year"), "tab allows the user to select a tax year and compare the tax unit income distribution 
                  and the distributional burden of different taxes. The ", em("Plotting Across Tax Years"), "tab allows the user to compare the 
                  tax unit income distribution and the distributional burden of different taxes across different tax years."),
          tags$p("Comparing the distribution of tax unit income and the different tax burden distributions can inform how progressive or 
                  regressive different components of the U.S. federal tax system. The data is pulled from publicly available files published by 
                  the Office of Tax Analysis which can be found ",
                  a("here.",
                  href = "https://home.treasury.gov/policy-issues/tax-policy/office-of-tax-analysis")),
          tags$h4("Definition:"),
          tags$p("Income is defined as wages, net income from a business or farm, taxable and tax-exempt interest, dividends, rental income, 
                  realized capital gains, unrealized gains at death, cash and near-cash transfers from the government, retirement benefits, and 
                  employer-provided health insurance (and other employer benefits)."),
          tags$h4("Source:"),
          tags$p("U.S. Department of the Treasury, Office of Tax Analysis - Distributional Analysis of the U.S. Tax System,", 
                 a("https://home.treasury.gov/policy-issues/tax-policy/office-of-tax-analysis", 
                 href = "https://home.treasury.gov/policy-issues/tax-policy/office-of-tax-analysis")),
        ),
             
      tabPanel("Plotting Within Tax Year", fluid = TRUE,
        
          selectInput(inputId = "yvar1_plot1",
                      label = "Variable One",
                      c("Tax Unit Income" = "Tax Unit Income",
                        "Total Federal Taxes" = "Total Federal Taxes",
                        "Individual Income Taxes" = "Individual Income Taxes",
                        "Payroll Taxes" = "Payroll Taxes", 
                        "Corporate Income Taxes" = "Corporate Income Taxes",
                        "Estate and Gift Taxes" = "Estate and Gift Taxes",
                        "Excise and Customs Duties" = "Excise and Customs Duties")),
              
          selectInput(inputId = "yvar2_plot1",
                      label = "Variable Two",
                      c("Tax Unit Income" = "Tax Unit Income",
                        "Total Federal Taxes" = "Total Federal Taxes",
                        "Individual Income Taxes" = "Individual Income Taxes",
                        "Payroll Taxes" = "Payroll Taxes", 
                        "Corporate Income Taxes" = "Corporate Income Taxes",
                        "Estate and Gift Taxes" = "Estate and Gift Taxes",
                        "Excise and Customs Duties" = "Excise and Customs Duties")),
            
          selectInput(inputId = "year_plot1",
                      label = "Tax Year",
                      c("2015" = 2015, 
                        "2016" = 2016,
                        "2017" = 2017,
                        "2018" = 2018,
                        "2019" = 2019)),
            
          actionButton(inputId = "go_plot1",
                       label = "Update"),
              
          plotOutput("plot1")
            
      ),
            
      tabPanel("Plotting Across Tax Years", fluid = TRUE,

          selectInput(inputId = "yvar1_plot2",
                      label = "Variable One",
                      c("Tax Unit Income" = "Tax Unit Income",
                        "Total Federal Taxes" = "Total Federal Taxes",
                        "Individual Income Taxes" = "Individual Income Taxes",
                        "Payroll Taxes" = "Payroll Taxes", 
                        "Corporate Income Taxes" = "Corporate Income Taxes",
                        "Estate and Gift Taxes" = "Estate and Gift Taxes",
                        "Excise and Customs Duties" = "Excise and Customs Duties")),
                   
          selectInput(inputId = "year1_plot2",
                      label = "Variable One Tax Year",
                      c("2015" = 2015, 
                        "2016" = 2016,
                        "2017" = 2017,
                        "2018" = 2018,
                        "2019" = 2019)),
                   
          selectInput(inputId = "yvar2_plot2",
                      label = "Variable Two",
                      c("Tax Unit Income" = "Tax Unit Income",
                        "Total Federal Taxes" = "Total Federal Taxes",
                        "Individual Income Taxes" = "Individual Income Taxes",
                        "Payroll Taxes" = "Payroll Taxes", 
                        "Corporate Income Taxes" = "Corporate Income Taxes",
                        "Estate and Gift Taxes" = "Estate and Gift Taxes",
                        "Excise and Customs Duties" = "Excise and Customs Duties")),
             
          selectInput(inputId = "year2_plot2",
                      label = "Variable Two Tax Year",
                      c("2015" = 2015, 
                        "2016" = 2016,
                        "2017" = 2017,
                        "2018" = 2018,
                        "2019" = 2019)),
                    
          actionButton(inputId = "go_plot2",
                      label = "Update"),
                      
          plotOutput("plot2")
                      
      )
  )
)                    

server <- function(input, output) {
 
# Tab 1
  
  # create reactive values
        x_plot1 <- eventReactive(input$go_plot1, {
          eval(parse(text=(paste0("dat", input$year_plot1, "$`Adjusted Tax Unit Income Decile`")))) 
        })
        
        y1_plot1 <- eventReactive(input$go_plot1, {
          eval(parse(text=(paste0("dat", input$year_plot1, "$`", input$yvar1_plot1, "`")))) 
        })
        
        y1_plot1_name <- eventReactive(input$go_plot1, {
          paste0(input$yvar1_plot1)
        })
        
        y2_plot1 <- eventReactive(input$go_plot1, {
          eval(parse(text=(paste0("dat", input$year_plot1, "$`", input$yvar2_plot1, "`")))) 
        })
        
        y2_plot1_name <- eventReactive(input$go_plot1, {
          paste0(input$yvar2_plot1)
        })
        
        year_plot1 <- eventReactive(input$go_plot1, {
          input$year_plot1 
  })
    
    # create plot
        output$plot1 <- renderPlot({
          ggplot() +
            geom_step(aes(x = x_plot1(), y = y1_plot1(), colour = y1_plot1_name()), size = 1.25) +
            geom_step(aes(x = x_plot1(), y = y2_plot1(), colour = y2_plot1_name()), size = 1.25) + 
            scale_colour_manual(name = "Legend", values=c(setNames(c("#2171b5", "#cb181d"), c(y1_plot1_name(), y2_plot1_name())))) +
            coord_cartesian(xlim = c(0, 100), ylim = c(-5, 100), expand = FALSE) + 
            labs(title = "\n\nDistribution by Tax Unit Decile", subtitle = paste0("TY", year_plot1()), caption = "\n\n\nData: U.S. Department of the Treasury, Office of Tax Analysis - Distributional Analysis of the U.S. Tax System\nhttps://home.treasury.gov/policy-issues/tax-policy/office-of-tax-analysis") +
            scale_x_continuous(name = "Tax Unit Deciles", breaks = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100), labels = c("", "10th", "20th", "30th", "40th", "50th", "60th",
                                                                                                                             "70th", "80th", "90th", "100th")) +
            scale_y_continuous(name = "Percent Share", breaks = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100), labels = c("0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%")) + 
            theme(
              panel.background = element_rect(fill = "white"),
              panel.border = element_rect(fill = NA, color = "black"),
              panel.grid.major = element_line(size = 0.5, linetype = "solid", color = "grey"),
              axis.title.x = element_text(vjust = -2),
              axis.title.y = element_text(margin = margin(t = 0, r = 10, b = 0, l = 0)),
              plot.caption = element_text(hjust = 0),
              plot.caption.position = "panel",
              legend.key=element_blank()
            )
        })
    
        
        
# Tab 2

    # create reactive values        
        x1_plot2 <- eventReactive(input$go_plot2, {
          eval(parse(text=(paste0("dat", input$year1_plot2, "$`Adjusted Tax Unit Income Decile`")))) 
        })
        
        x2_plot2 <- eventReactive(input$go_plot2, {
          eval(parse(text=(paste0("dat", input$year2_plot2, "$`Adjusted Tax Unit Income Decile`")))) 
        })
        
        y1_plot2 <- eventReactive(input$go_plot2, {
          eval(parse(text=(paste0("dat", input$year1_plot2, "$`", input$yvar1_plot2, "`")))) 
        })
        
        y1_plot2_name <- eventReactive(input$go_plot2, {
          paste0(input$yvar1_plot2, ", TY", input$year1_plot2)
        })
        
        y2_plot2 <- eventReactive(input$go_plot2, {
          eval(parse(text=(paste0("dat", input$year2_plot2, "$`", input$yvar2_plot2, "`")))) 
        })
        
        y2_plot2_name <- eventReactive(input$go_plot2, {
          paste0(input$yvar2_plot2, ", TY", input$year2_plot2)
        })
        

  # create plot
      output$plot2 <- renderPlot({
        ggplot() +
          geom_step(aes(x = x1_plot2(), y = y1_plot2(), colour = y1_plot2_name()), size = 1.25) +
          geom_step(aes(x = x2_plot2(), y = y2_plot2(), colour = y2_plot2_name()), size = 1.25) + 
          scale_colour_manual(name = "Legend", values=c(setNames(c("#2171b5", "#cb181d"), c(y1_plot2_name(), y2_plot2_name())))) +
          coord_cartesian(xlim = c(0, 100), ylim = c(-5, 100), expand = FALSE) + 
          labs(title = "\n\nDistribution by Tax Unit Decile", caption = "\n\n\nData: U.S. Department of the Treasury, Office of Tax Analysis - Distributional Analysis of the U.S. Tax System\nhttps://home.treasury.gov/policy-issues/tax-policy/office-of-tax-analysis") +
          scale_x_continuous(name = "Tax Unit Deciles", breaks = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100), labels = c("", "10th", "20th", "30th", "40th", "50th", "60th",
                                                                                                                           "70th", "80th", "90th", "100th")) +
          scale_y_continuous(name = "Percent Share", breaks = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100), labels = c("0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%")) + 
          theme(
            panel.background = element_rect(fill = "white"),
            panel.border = element_rect(fill = NA, color = "black"),
            panel.grid.major = element_line(size = 0.5, linetype = "solid", color = "grey"),
            axis.title.x = element_text(vjust = -2),
            axis.title.y = element_text(margin = margin(t = 0, r = 10, b = 0, l = 0)),
            plot.caption = element_text(hjust = 0),
            plot.caption.position = "panel",
            legend.key=element_blank()
          )
      })
}


shinyApp(ui = ui, server = server)

