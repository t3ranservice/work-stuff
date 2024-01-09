from opencensus.stats import aggregation as aggregation_module
from opencensus.stats import measure as measure_module
from opencensus.stats import stats as stats_module
from opencensus.stats import view as view_module
from opencensus.tags import tag_map as tag_map_module

stats = stats_module.stats
view_manager = stats.view_manager
stats_recorder = stats.stats_recorder

airship_users_200 = measure_module.MeasureInt("Successfull /api/named_users calls", "The number of successfull AirShip calls",
                                          "200S")

airship_users_fail = measure_module.MeasureInt("Failed /api/named_users calls", "The number of failed AirShip calls",
                                          "non-200S")

airship_email_200 = measure_module.MeasureInt("Successfull /api/channels/email calls", "The number of successfull AirShip calls",
                                          "200S")

airship_email_fail = measure_module.MeasureInt("Failed /api/channels/email calls", "The number of failed AirShip calls",
                                          "non-200S")

airship_events_200 = measure_module.MeasureInt("Successfull /api/custom-events calls", "The number of successfull AirShip calls",
                                          "200S")

airship_events_fail = measure_module.MeasureInt("Failed /api/custom-events calls", "The number of failed AirShip calls",
                                          "200S")


shiplogic_200 = measure_module.MeasureInt("Successfull shiplogic calls", "The number of successfull shiplogic calls",
                                          "200S")

shiplogic_fails = measure_module.MeasureInt("Failed shiplogic calls", "The number of failed shiplogic calls",
                                            "non-200S")

shiplogic_200_view = view_module.View("Shiplogic -- 200", "The number of successful requests to shiplogic API",
                                      [], shiplogic_200, aggregation_module.CountAggregation())

shiplogic_fails_view = view_module.View("Shiplogic -- fails", "The number of failed requests to shiplogic API",
                                      [], shiplogic_fails, aggregation_module.CountAggregation())




acquisitions_200 = measure_module.MeasureInt("Successful requests to acquisitions endpoint", "The number of successful requests to netverify/v2/acquisitions",
                                             "200S")

acquisitions_fails = measure_module.MeasureInt("Failed requests to acquisitions endpoint", "The number of failed requests to netverify/v2/acquisitions",
                                             "non-200S")

searchMembers_200 = measure_module.MeasureInt("Successfull searchMembers operations",
                                              "The number of successful searchMembers operations",
                                              "200S")

searchMembers_fails = measure_module.MeasureInt("Failed searchMembers operations",
                                                "The number of failed searchMembers operations",
                                                "200S")

listAccounts_200 = measure_module.MeasureInt("Succesful listAccounts operations",
                                             "The number of successfull listAccounts operations",
                                             "200S")
listAccounts_fails = measure_module.MeasureInt("Failed listAccounts operations",
                                               "The number of failed listAccounts operations",
                                               "non-200S")

token_auth_200 = measure_module.MeasureInt("Successful authorizations",
                                           "The number of authorization returned 200",
                                           "200S")

api_accounts_200 = measure_module.MeasureInt("/account calls",
                                             "Successful account calls",
                                             "200S")

initialise_200 = measure_module.MeasureInt("TR initialise calls",
                                           "Successfull calls",
                                           "200S")

LoginRequest_200 = measure_module.MeasureInt("TR login calls",
                                             "Successfull calls",
                                             "200S")

LoginRequest_fails = measure_module.MeasureInt("TR failed logins",
                                               "Failed Login calls to Traderoot",
                                               "non-200S")

token_auth_fails = measure_module.MeasureInt("Failed auhtorizations",
                                             "The number of failed authorization for token",
                                             "non-200s")



api_accounts_fails = measure_module.MeasureInt("Failed /account calls", "Failed calls to /accounts endpoint",
                                               "non-200s")

initialise_fails = measure_module.MeasureInt("Failed TR initialise calls", "Failed calls to Traderoot initialise sess",
                                             "non-200s")


airship_email_200_view = view_module.View("AirShip /api/channels/email -- 200", "The number of successfull requests to /api/channels/email at AirShip",
                                          [], airship_email_200, aggregation_module.CountAggregation())

airship_email_fail_view = view_module.View("AirShip /api/channels/email -- fail", "The number of failed requests to /api/channels/email at AirShip",
                                          [], airship_email_fail, aggregation_module.CountAggregation())

airship_users_200_view = view_module.View("AirShip /api/named_users -- 200", "The number of successful requests to /api/named_users at AirShip",
                                          [], airship_users_200, aggregation_module.CountAggregation())

airship_users_fail_view = view_module.View("AirShip /api/named_users -- fail", "The number of failed requests to /api/named_users at AirShip",
                                          [], airship_users_fail, aggregation_module.CountAggregation())

airship_events_200_view = view_module.View("AirShip /api/custom-events -- 200", "The number of successful requests to /api/custom-events at AirShip",
                                          [], airship_events_200, aggregation_module.CountAggregation())

airship_events_fail_view = view_module.View("AirShip /api/custom-events -- fail", "The number of fail requests to /api/custom-events at AirShip",
                                          [], airship_events_fail, aggregation_module.CountAggregation())



acquisitions_200_view = view_module.View("Jumio /acquisitions -- 200", "Number of successful requests to /acquisitions at Jumio",
                                         [], acquisitions_200, aggregation_module.CountAggregation())

acquisitions_fails_view = view_module.View("Jumio /acquisitions fails", "Number of failed requests to /acquisitions at Jumio",
                                         [], acquisitions_fails, aggregation_module.CountAggregation())

searchMembers_200_view = view_module.View("TradeRoot searchMembers -- 200", "Number of successful searchMembers operations",
                                          [], searchMembers_200, aggregation_module.CountAggregation())

searchMembers_fails_view = view_module.View("Fails of TradeRoot searchMembers", "Number of failed searchMembers operations",
                                            [], searchMembers_fails, aggregation_module.CountAggregation())

listAccounts_200_view = view_module.View("TradeRoot listAccounts -- 200", "Number of succesfull listAccounts operations",
                                         [], listAccounts_200, aggregation_module.CountAggregation())
listAccounts_fails_view = view_module.View("Fails of TradeRoot listAccounts", "Number of failed listAccounts operations",
                                           [], listAccounts_fails, aggregation_module.CountAggregation())

LoginRequest_fails_view = view_module.View("Fails to TR Login endpoint", "Number of failed logins to TradeRoot",
                                           [], LoginRequest_fails, aggregation_module.CountAggregation())

LoginRequest_view = view_module.View("TradeRoot login -- 200", "Number of successfull logins to TradeRoot",
                                     [], LoginRequest_200, aggregation_module.CountAggregation())

accounts_fails_view = view_module.View("Fails to /account endpoints", "Number of failed POSTs to /account endpoint",
                                       [], api_accounts_fails, aggregation_module.CountAggregation())

auth_fails_view = view_module.View("Token auths fails",
                                   "Number of failed token authorizations",
                                   [],
                                   token_auth_fails,
                                   aggregation_module.CountAggregation())

initialise_fails_view = view_module.View("Initialise TR fails", "Number of failed session initialisations",
                                         [],
                                         initialise_fails,
                                         aggregation_module.CountAggregation())

initialise_view = view_module.View("Initialise TR --- 200", "Number of successful TR initialisations",
                                   [], initialise_200, aggregation_module.CountAggregation())

auth_view = view_module.View("Token Authorization -- 200",
                               "Number of successful authorizations",
                               [],
                               token_auth_200,
                               aggregation_module.CountAggregation())

accounts_view = view_module.View("/accounts calls - 200", "Number of successful calls to /v1/accounts",
                                 [], api_accounts_200, aggregation_module.CountAggregation())

view_manager.register_view(airship_email_200_view)
view_manager.register_view(airship_users_200_view)
view_manager.register_view(airship_events_200_view)
view_manager.register_view(airship_email_fail_view)
view_manager.register_view(airship_users_fail_view)
view_manager.register_view(airship_events_fail_view)
view_manager.register_view(shiplogic_200_view)
view_manager.register_view(shiplogic_fails_view)
view_manager.register_view(acquisitions_200_view)
view_manager.register_view(acquisitions_fails_view)
view_manager.register_view(searchMembers_200_view)
view_manager.register_view(searchMembers_fails_view)
view_manager.register_view(LoginRequest_fails_view)
view_manager.register_view(LoginRequest_view)
view_manager.register_view(listAccounts_200_view)
view_manager.register_view(listAccounts_fails_view)
view_manager.register_view(auth_fails_view)
view_manager.register_view(auth_view)
view_manager.register_view(accounts_view)
view_manager.register_view(accounts_fails_view)
view_manager.register_view(initialise_view)
view_manager.register_view(initialise_fails_view)
mmap = stats_recorder.new_measurement_map()
tmap = tag_map_module.TagMap()