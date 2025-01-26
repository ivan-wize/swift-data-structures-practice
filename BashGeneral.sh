# Bash Cheat Sheet for iOS CI/CD Pipelines

# MARK: - General Bash Commands and Rules
# 1. Use `echo` to print output to the console.
#    Example: echo "Hello, World!"
# 2. Use `export` to set environment variables for the current session or scripts.
#    Example: export VAR_NAME="value"
# 3. Use `if [ condition ]; then ... fi` for conditionals.
#    Example: if [ "$VAR" == "value" ]; then echo "Matched!"; fi
# 4. Loops:
#    - For Loop: for var in {start..end}; do ... done
#    - While Loop: while [ condition ]; do ... done
# 5. Command Substitution: Capture command output using $(command).
#    Example: DATE=$(date)
# 6. Exit Codes: `$?` holds the exit code of the last executed command.
#    Example: if [ $? -ne 0 ]; then echo "Command failed!"; fi
# 7. Script Exit: Use `exit <code>` to exit a script with a specific code.
# 8. Comments: Use `#` to add comments in scripts.

# MARK: - Setting Up the Environment
# Ensures that all required tools and dependencies are loaded.
echo '-------------------------------------------------------------'
echo ' Setup of Environment'
echo '-------------------------------------------------------------'

# Load Ruby via rbenv and configure paths
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)" # Initialize rbenv for the current session
export PATH="$HOME/.rbenv/shims:$PATH"

# Set locale and Java settings
export LC_ALL=en_US.UTF-8 # Set locale to English (UTF-8)
export LANG=en_US.UTF-8   # Set language
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH" # Add Java to PATH

# Verify installed versions of Ruby and Bundler
ruby --version # Print the installed Ruby version
gem --version  # Print the installed RubyGem version
bundler --version # Print the installed Bundler version

# Display the current build number for reference
echo "Current Build Num ${BITBUCKET_BUILD_NUMBER}"

# MARK: - Dependency Installation
# Installs required Ruby gems and iOS pods.
echo '-------------------------------------------------------------'
echo ' Installation of bundles and pods'
echo '-------------------------------------------------------------'

rm Podfile.lock # Remove Podfile.lock to ensure a clean pod installation

# Install and update Ruby gem dependencies
bundle install           # Install all required gems listed in the Gemfile
bundle update --bundler  # Ensure the latest version of Bundler is used

# Install CocoaPods dependencies for the iOS project
pod install              # Install pods specified in the Podfile
export LAST_EXIT_CODE=$? # Capture the exit code of the last command
if [ $LAST_EXIT_CODE != 0 ]; then exit $LAST_EXIT_CODE; fi

pod update               # Update all pods to their latest versions
export LAST_EXIT_CODE=$?
if [ $LAST_EXIT_CODE != 0 ]; then exit $LAST_EXIT_CODE; fi

# MARK: - Build Configuration and Execution
# Setting build numbers and running Fastlane commands
echo '-------------------------------------------------------------'
echo ' Set Build Number and Build'
echo '-------------------------------------------------------------'

fastlane set_build_number build:${BITBUCKET_BUILD_NUMBER} # Set the build number using Fastlane
export LAST_EXIT_CODE=$?
if [ $LAST_EXIT_CODE != 0 ]; then exit $LAST_EXIT_CODE; fi

fastlane ${FASTLANE_BUILD_LANE} # Build the app using the specified Fastlane lane
export LAST_EXIT_CODE=$?
if [ $LAST_EXIT_CODE != 0 ]; then exit $LAST_EXIT_CODE; fi

# MARK: - Automation Test Setup
# Preparing the environment for running Robot Framework tests
echo '-------------------------------------------------------------'
echo ' Installation for Automation Tests'
echo '-------------------------------------------------------------'

cd TestAutomation # Navigate to the test automation directory

# Install Robot Framework and related Python packages
pip3 install robotframework junitparser trcli # Install required Python packages

# Add Robot Framework to the system PATH
export PATH="$(which robot | sed -e "s/\/robot//"):$PATH"

sh RobotFrameworkSetup.sh # Run custom setup script for automation

echo '-------------------------------------------------------------'
echo ' Running Automation Tests'
echo '-------------------------------------------------------------'

# Run Robot Framework tests and specify results directory
export IPA_FILE_NAME_PATH=$(ls ../auto-build/ColdPlunge-*${BITBUCKET_BUILD_NUMBER}-${FILE_NAME_BUILD}.ipa)
robot -d Results -x junit-report.xml Tests/${AUTO_TEST_FILENAME}.robot
LAST_EXIT_CODE=$?

# MARK: - Test Results Reporting
# Sending test results to TestRail
echo '-------------------------------------------------------------'
echo ' Sending Test Results to TestRail'
echo '-------------------------------------------------------------'

formatted_date=$(date "+%m/%d/%y") # Format the current date
formatted_time=$(date "+%I:%M%p") # Format the current time

# Send test results to TestRail using trcli
trcli -n \
-h https://plunge.testrail.com \
--username "ivan@plunge.com" \
--password "ColdPlunge123!" \
--project "Plunge Master Test Plan" \
parse_junit \
-f /Users/mobileautomation/Runner/atlassian-bitbucket-pipelines-runner/temp/results/junit-report.xml \
--title "Regression Test Run $formatted_date $formatted_time"

# Increment exit code based on the result of the trcli command
LAST_EXIT_CODE=$((LAST_EXIT_CODE + $?))
if [ $LAST_EXIT_CODE != 0 ]; then
    echo "Sending test results to TestRail failed."
    exit $LAST_EXIT_CODE
fi

# MARK: - Upload Build to Apple
# Deploy the build to Apple for testing
echo '-------------------------------------------------------------'
echo ' Uploading Build to Apple'
echo '-------------------------------------------------------------'

fastlane upload build_type:"${FILE_NAME_BUILD}" # Upload the build using Fastlane
export LAST_EXIT_CODE=$?
if [ $LAST_EXIT_CODE != 0 ]; then exit $LAST_EXIT_CODE; fi

# MARK: - Conclusion
# This cheat sheet outlines steps for setting up, building, and automating tests in a CI/CD pipeline for iOS apps.
# Use these snippets and customize them for your specific environment.
