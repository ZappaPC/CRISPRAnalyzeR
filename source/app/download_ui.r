# sourced by 'ui.r'
# save as 'download_ui.r'
# ui elements for Downloads tab



tabItem(tabName = "downloads", align = "center",

  shinyjs::useShinyjs(),
  
  fluidRow(style="width:80%",
           
           shiny::HTML("
                <body>
                <div class='section'>
                <div class='container'>
                <div class='row'>
                <div class='col-md-12'>
                <h1 class='text-success text-left'>
                <i class='fa fa-angle-double-right  fa-fw'></i>Download Report
                <font color='#777777'>
                <span style='font-size: 23.3999996185303px; line-height: 23.3999996185303px;'>Adjust your report</span>
                </font>
                </h1>
                <hr>
                <p class='lead'>CRISPRAnalyzeR not only provides you with individually plots and tables, but also gives you the opportunity to configure a report.
                <br>
                </p>
                </div>
                </div>
                </div>
                </div>
                ")),
  
  # HELP as including of download_help.r
  source(file.path(config$appDir, "download_help.r"))[1],
  shiny::tags$br(),
  shiny::tags$hr(width="85%"),

 
  
  fluidRow(
           column(width=10, offset=1,
                  column(width=10,offset=1,
                         shiny::tags$br(),
                         shiny::tags$p(class="lead","You can get a full report including all data, which can be adjusted and downloaded on this site."),

                         shiny::tags$p(class="text-justify","Once you created plots and tables on this website, you can also download them as part of an interactive HTML file.",
                                       "Thereby, you not only have them organized in a single document but they are also still interactive,
                                       which is good for browsing and exploring the data offline.",
                                       "If you really like our plots and want to use them for a presentation or print them, you can always click
                                       on the download icon in the top right corner of each plot - this also works in the downloaded report.",
                                       "By doing this, you can convert a plot to a .pdf, .png or other formats.
                                       ")
                         )
                  )


  ),

  shiny::tags$br(),

  fluidRow(
     column(10,offset=1,
  #          # Now we add the box
  #          ## sgRNA library upload Box
            box(title = "Step 1: Select Components that will be present in the report", collapsible = TRUE,
                width = 12,
                solidHeader = TRUE,
                status = "primary",
               shiny::tags$p("In general, CRISPRAnalyzeR will add all common plots and tables to the report.",shiny::tags$br(),
                             "For all plots and tables that depent on your direct selection, you have to add these to the report by clicking a button.
                             Throughout CRISPRAnalyzeR you will find the 'Add to Report'-buttons, which will add the generated plots/tables to your report."),
               helpText("Please note: the CRISPRAnalyzeR report is a fully-interactive HTML file"),
               shiny::tags$hr(),
                helpText("Please select the components to be included in your report:"),
                HTML("<table id='downloads_table'>"),
                shiny::tags$tr(
                  shiny::tags$th(shinyWidgets::awesomeCheckbox("report_sqCheck", "Add Screen Quality to Report", value = TRUE)),
                  shiny::tags$th(shiny::tags$div(id = "report_sq", "Include plots and tables that represent your screen in various ways.", uiOutput("report_sqList")))
                ),
               shiny::tags$tr(
                 shiny::tags$th(shinyWidgets::awesomeCheckbox("report_hcCheck", "Add Hit Calling to Report", value = TRUE)),
                 shiny::tags$th(shiny::tags$div(id = "report_hc", "Include plots and tables of different differential expression analyses employed on your screen."))
               ),
               shiny::tags$tr(
                 shiny::tags$th(shinyWidgets::awesomeCheckbox("report_ovCheck", "Add Gene Overviews to Report", value = TRUE)),
                 shiny::tags$th(shiny::tags$div(id = "report_ov", uiOutput("report_ovList")))
               ),
               shiny::tags$tr(
                 shiny::tags$th(shinyWidgets::awesomeCheckbox("report_sgCheck", "Add sgRNA plots to Report", value = TRUE)),
                 shiny::tags$th(shiny::tags$div(id = "report_sg", uiOutput("report_sgList")))
               ),
               shiny::tags$tr(
                 shiny::tags$th(shinyWidgets::awesomeCheckbox("report_coCheck", "Add Gene Comparisons to Report", value = TRUE)),
                 shiny::tags$th(shiny::tags$div(id = "report_co", uiOutput("report_coList")))
               ),
               shiny::tags$tr(
                 shiny::tags$th(shinyWidgets::awesomeCheckbox("report_anCheck", "Add Gene Annotations to Report", value = TRUE)),
                 shiny::tags$th(shiny::tags$div(id = "report_an", uiOutput("report_anList")))
               ),
               shiny::tags$tr(
                 shiny::tags$th(shinyWidgets::awesomeCheckbox("report_enCheck", "Add Gene Set Analysis to Report", value = TRUE)),
                 shiny::tags$th(shiny::tags$div(id = "report_en", uiOutput("report_enList")))
               ),
               HTML("</table>")


            ))
     ),
  
  fluidRow(
    column(10,offset=1,
           # Now we add the box
           ## sgRNA library upload Box
           box(title = "Step 2: Provide general information about your screen", collapsible = TRUE,
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               #column(width=6,
                      shiny::tags$p("A good reports needs additional information about the screening procedure."),
                      #shiny::tags$hr(),

               shiny::tags$p(style="font-weight:bold;", "Experiment Title"), #shiny::tags$br(),
               # HTML('<textarea id="report_title" rows="2" cols="100"></textarea>'), br(), # don't know how to incorporate title (since it is not written as R code)

                      shiny::tags$p(style="font-weight:bold;", "Aim / Hypothesis of the screen"), #shiny::tags$br(),
                      HTML('<textarea id="report_scope" rows="3" cols="100"></textarea>'), shiny::tags$br(),
                      shiny::tags$p(style="font-weight:bold;", "Screening Procedure"), #shiny::tags$br(),
                      HTML('<textarea id="report_procedure" rows="3" cols="100"></textarea>'), shiny::tags$br(),

               shiny::tags$div(shiny::tags$p(style="font-weight:bold;", "Organism"), HTML('<textarea id="report_organism" rows="1" cols="100"></textarea>')), shiny::tags$br(),
               shiny::tags$div(shiny::tags$p(style="font-weight:bold;", "Cell Line"), HTML('<textarea id="report_cellline" rows="1" cols="100"></textarea>')), shiny::tags$br(),
               shiny::tags$div(shiny::tags$p(style="font-weight:bold;", "Experimentator"), HTML('<textarea id="report_experimentator" rows="1" cols="100"></textarea>')), shiny::tags$br(),
               shiny::tags$div(shiny::tags$p(style="font-weight:bold;", "Plasmid used"), HTML('<textarea id="report_plasmid" rows="1" cols="100"></textarea>')), shiny::tags$br(),
               shiny::tags$div(shiny::tags$p(style="font-weight:bold;", "sgRNA Library Name"), HTML('<textarea id="report_library" rows="1" cols="100"></textarea>')), shiny::tags$br(),
               shiny::tags$div(shiny::tags$p(style="font-weight:bold;", "Number of Cells per sgRNA (Coverage)"), HTML('<textarea id="report_coverage" rows="1" cols="100"></textarea>')), shiny::tags$br(),
               shiny::tags$div(shiny::tags$p(style="font-weight:bold;", "Treatment"), HTML('<textarea id="report_treatment" rows="1" cols="100"></textarea>')), shiny::tags$br(),

               shiny::tags$div(shiny::tags$p(style="font-weight:bold;", "Sequencing Primer"), HTML('<textarea id="report_seqprimer" rows="1" cols="100"></textarea>')), shiny::tags$br(),
               shiny::tags$div(shiny::tags$p(style="font-weight:bold;", "Sequencing"), HTML('<textarea id="report_seqkit" rows="1" cols="100"></textarea>')), shiny::tags$br(),

                      shiny::tags$p(style="font-weight:bold;", "Additional Comments"), #shiny::tags$br(),
                      HTML('<textarea id="report_comments" rows="3" cols="100"></textarea>'),
               helpText("Please add further information in the text boxes above so CRISPRAnalyzeR can include them into your report.")



                      #),
               #column(width=6



               #)
           ))
  ),
  
  fluidRow(
    column(width=4, offset=4,
           actionButton('createReport', 'Create HTML Report'),
           downloadButton('downloadReport', 'Download HTML Report')#,
           #uiOutput("reportGen_error")
            ),
    column(width=8, offset=2, class="alert alert-info", style="margin-top:20px;",
           shiny::tags$span(style="float:left;" , shiny::HTML('<i class="fa fa-info fa-4x" aria-hidden="true"></i>')),
           shiny::tags$span(
             HTML("Depending on the size of your screen the <strong>report generation might take several minutes up to an hour</strong>.</br>
                  <strong>Please be patient</strong> - the report will be <strong>ready for download </strong> as soon as it is finished.</br>
                  </br>
                  </br>
                  <strong>For genome-wide screens, the report generation might fail due to memory limitations.</br>
                  You can find a solution <a class='text' href='https://github.com/boutroslab/CRISPRAnalyzeR#increasing-the-core-ulimit' target='_blank' >at the Github page</a></strong>.")
           )
    )
  ),
  
  
  shiny::tags$br(),
  # load footer  
  source(file.path(config$appDir, "footer.r"))[1]
) # close tab
