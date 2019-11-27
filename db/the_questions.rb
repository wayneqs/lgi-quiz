class TheQuestions
    
    def questions
        [
            { 
                prompt: "What is the name of our cloud provider?", 
                question_options_attributes: [ 
                    { 
                        prompt: "Microsoft Azure", 
                        score: 1
                    },
                    { 
                        prompt: "Google Cloud", 
                        score: 0
                    },
                    { 
                        prompt: "Amazon Web Services", 
                        score: 0
                    },
                    { 
                        prompt: "IBM Cloud", 
                        score: 0
                    }]
            },
            { 
                prompt: "What is cloud computing?", 
                question_options_attributes: [ 
                    { 
                        prompt: "Computing outside in the elements", 
                        score: 0
                    },
                    { 
                        prompt: "An outsourced computing model where companies leverage other companies' computing resources", 
                        score: 1
                    },
                    { 
                        prompt: "A computing model that promotes on-demand availability of computing resources", 
                        score: 2
                    },
                    { 
                        prompt: "A software development methodology", 
                        score: 0
                    }]
            },
            { 
                prompt: "What of the following is a benefit of cloud computing?", 
                question_options_attributes: [ 
                    { 
                        prompt: "Ability to attract and retain technical talent", 
                        score: 2
                    },
                    { 
                        prompt: "Reduced operational expenditure costs", 
                        score: 0
                    },
                    { 
                        prompt: "Ability to rapidly scale resources to match demand", 
                        score: 4
                    },
                    { 
                        prompt: "Databases must be smaller than 100GB", 
                        score: 0
                    }]
            },
            { 
                prompt: "Which of the following is a layer of cloud computing?", 
                question_options_attributes: [ 
                    { 
                        prompt: "Platform Provided Service Orchestrator (PPSO)", 
                        score: 0
                    },
                    { 
                        prompt: "Infrastructure As A Service (IaaS)", 
                        score: 1
                    },
                    { 
                        prompt: "Sandwitches As A Service (SaaS)", 
                        score: 0
                    },
                    { 
                        prompt: "Platform As A Sandbox (PaaS)", 
                        score: 0
                    }]
            },
            { 
                prompt: "Which one of the following is a cloud deployment model?", 
                question_options_attributes: [ 
                    { 
                        prompt: "Partial Cloud", 
                        score: 0
                    },
                    { 
                        prompt: "Hybrid Cloud", 
                        score: 2
                    },
                    { 
                        prompt: "Sideloaded Cloud", 
                        score: 0
                    },
                    { 
                        prompt: "Single Cloud", 
                        score: 1
                    }]
            } 
        ]
    end
end