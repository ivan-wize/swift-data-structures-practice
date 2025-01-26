# Fastlane Cheat Sheet

# This file demonstrates how to configure and use Fastlane for an iOS project.
# Includes best practices, reusable methods, and common commands with detailed comments.

# Import Fastlane tools
# Documentation: https://docs.fastlane.tools

default_platform(:ios) # Specify the default platform

platform :ios do

  # ---------------------------------------------------------------------------
  # Global Variables: Define project-specific variables for reuse
  # ---------------------------------------------------------------------------

  PROJECT_FILE = "ColdPlunge.xcodeproj"          # Path to your Xcode project file
  WORKSPACE = "ColdPlunge.xcworkspace"           # Path to your Xcode workspace file
  SCHEMA = "ColdPlunge"                          # Scheme to build
  APP_IDENTIFIER = "com.plunge.PlungeApp"        # iOS app bundle identifier
  WATCHKIT_APP_IDENTIFIER = "com.plunge.PlungeApp.watchkitapp" # WatchKit app bundle identifier
  TEAM_ID = "577R96D4YH"                         # Apple Developer Team ID

  API_KEY_ID = "V92R652X4Y"                      # API key ID for App Store Connect
  API_KEY_ISSUER = "41f571a1-4e6e-4bea-9bdb-bd317912062c" # API key issuer ID
  API_KEY_FILENAME = "./fastlane/AuthKey_V92R652X4Y.p8"   # Path to the API key file

  # Use ENV variables for sensitive data (e.g., API_KEY_CONTENT)
  API_KEY_CONTENT = ENV["APP_STORE_KEY_CONTENT"]

  # ---------------------------------------------------------------------------
  # Reusable Methods: Define helper functions for common tasks
  # ---------------------------------------------------------------------------

  desc "Authorize Fastlane to connect to App Store Connect"
  def getAppStoreAPIKey
    app_store_connect_api_key(
      key_id: API_KEY_ID,
      issuer_id: API_KEY_ISSUER,
      key_filepath: API_KEY_FILENAME,
      duration: 1200, # Max duration (20 minutes)
      in_house: false
    )
  end

  desc "Retrieve the current git commit hash"
  def getGitCommitHash
    commit = last_git_commit
    commit[:commit_hash]
  end

  desc "Get the current version and build number"
  def versionNumber
    version = get_version_number(xcodeproj: PROJECT_FILE, target: SCHEMA)
    build_num = get_build_number(xcodeproj: PROJECT_FILE)
    "#{version}.#{build_num}"
  end

  desc "Log a message with formatting"
  def message(msg)
    UI.important("----------------------------------------")
    UI.important("  #{msg}")
    UI.important("----------------------------------------")
  end

  # ---------------------------------------------------------------------------
  # Available Lanes: Define tasks to automate using Fastlane
  # ---------------------------------------------------------------------------

  desc "Set the build number in the project"
  lane :set_build_number do |options|
    new_build_num = options[:build] || "1"
    message("Setting build number to #{new_build_num}")
    ios_set_build_number(build_number: new_build_num.to_i)
    message("Updated version: #{versionNumber()}")
  end

  desc "Clean the Xcode project"
  lane :clean do
    message("Cleaning project for scheme: #{SCHEMA}")
    xcclean(workspace: WORKSPACE, scheme: SCHEMA)
  end

  desc "Sync certificates and provisioning profiles"
  lane :update_provision_file do |options|
    build_type = options[:build_type] || "development"
    message("Syncing certificates and profiles for build type: #{build_type}")

    sync_code_signing(
      type: build_type,
      team_id: TEAM_ID,
      app_identifier: [APP_IDENTIFIER, WATCHKIT_APP_IDENTIFIER]
    )
  end

  desc "Build the app"
  lane :build do |options|
    sign_type = options[:build_type] || "development"
    message("Building app for scheme: #{SCHEMA}, type: #{sign_type}")

    build_app(
      workspace: WORKSPACE,
      scheme: SCHEMA,
      export_method: sign_type,
      clean: options[:clean] || false,
      output_directory: "builds",
      output_name: "ColdPlunge-#{versionNumber()}-#{sign_type}"
    )
  end

  desc "Upload to TestFlight"
  lane :upload do |options|
    ipa_file = "builds/ColdPlunge-#{versionNumber()}-#{options[:build_type]}.ipa"
    message("Uploading IPA to TestFlight: #{ipa_file}")

    upload_to_testflight(
      api_key: getAppStoreAPIKey(),
      ipa: ipa_file,
      skip_waiting_for_build_processing: true
    )
  end

  # ---------------------------------------------------------------------------
  # Combined Lanes for Common Workflows
  # ---------------------------------------------------------------------------

  desc "Build and upload development version"
  lane :build_dev do
    clean
    update_provision_file(build_type: "development")
    build(build_type: "development")
    message("Development build complete")
  end

  desc "Build and upload Ad-Hoc version"
  lane :build_beta do
    clean
    update_provision_file(build_type: "adhoc")
    build(build_type: "adhoc")
    upload(build_type: "adhoc")
  end

  desc "Build and upload App Store version"
  lane :build_app_store do
    clean
    update_provision_file(build_type: "appstore")
    build(build_type: "appstore")
    upload(build_type: "appstore")
  end

end

# ---------------------------------------------------------------------------
# General Best Practices for Fastlane
# ---------------------------------------------------------------------------
# 1. Use ENV variables to store sensitive data (e.g., API keys, passwords).
# 2. Modularize lanes to make them reusable and maintainable.
# 3. Validate and test lanes locally before integrating them into CI/CD.
# 4. Leverage `match` for managing code signing across teams.
# 5. Use meaningful names for lanes and helper methods.
# 6. Keep Fastlane dependencies up-to-date to ensure compatibility.
