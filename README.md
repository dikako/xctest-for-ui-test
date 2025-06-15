# UI automation with Xcode

WWDC25 [Record, replay, and review: UI automation with Xcode](https://developer.apple.com/videos/play/wwdc2025/344/)<br>
[![Watch the video](https://img.youtube.com/vi/TI-XF0M8Ge0/0.jpg)](https://www.youtube.com/watch?v=TI-XF0M8Ge0)


## Folder Structure 
- `poc`: Main application project folder
- `pocTest`: Contains unit tests for verifying individual components and logic
- `pocUITests`: Contains end-to-end UI tests, **maintained by the QA team**, for functional testing of the user interface

## 🎙 What’s New (as of June 2025)
### 1. Record Your Interactions
- You can now record UI flows directly within Xcode. With the test cursor placed inside an XCTest UI method, click **“Start Recording”** in the gutter.
- Xcode boots the app in simulator and logs every tap, swipe, and button press—then converts them into structured XCTest/**XCUIElement** calls 

### 2. Replay Across Multiple Configs
- Use Test Plans to run recorded tests on different devices, locales, orientations, and system states—all in one shot 
- Xcode supports launches across languages (especially with long strings and RTL layouts), device types, Dark/Light mode, and more 

### 3. Review Results with Media
- After tests complete, review passes and failures via the Xcode Test Report.
- Grab video recordings and screenshots for each run. Plus, use the Automation Explorer to replay failures and inspect element-level information—including actual vs. expected element types/tap targets 

### 4. Ease Troubleshooting & Improve Test Robustness
- Automation Explorer shows exactly where failures happened. For example, if a TextField was actually a TextView, Xcode pinpoints the mistake and even suggests the correct code snippet—no guesswork required 
- Generated tests include multiple identifier options. You can fine-tune element locators right in the editor.

## 💡 Why It Matters for iOS QA
- **Build Tests by Example**: No manual scripting—record and start verifying flows in minutes.
- **Ensure Consistency Across Environments**: Catch UI bugs early, whether they’re related to language, device type, or orientation.
- **Speed Up Debugging**: Media playback + UI element inspection = fast root cause analysis.
- **Tight Integrations with CI/CD**: Pair with Xcode Cloud for automated validation on each PR or nightly build.

✅ Best Practices from the Session
- **Prep Your App for Automation**: Add accessibility identifiers to UI elements for stable recording 
- **Organize with Test Plans**: Use multiple device and locale configurations to cover your supported matrix in one run 
- **Refine Locators Post-Record**: Improve stability by choosing strong identifiers after recording your flow.


## Benefits of QA Creating UI Functional Tests in the Same Project
Integrating UI functional tests directly into the main iOS development project brings several advantages:

- Faster Feedback Loop:
  QA engineers can validate new features as soon as they are developed, enabling early detection of UI or behavioral issues.
- Improved Collaboration:
  Developers and QA work within the same codebase, making it easier to align on test coverage, element identifiers, and test scenarios.
- Version Alignment:
  Tests are always in sync with the latest app version, reducing risks from mismatches between test and app code.
- Simplified CI/CD Integration: 
  Running functional UI tests as part of the same pipeline ensures automated validation with every build or pull request.
- Better Maintenance:
  Sharing the same project structure reduces duplication and makes it easier to refactor or update tests alongside app changes.
- Encourages Test-Driven Development (TDD): 
  QA involvement in the same project promotes earlier thinking about testability and behavior expectations.

## 🧪 UI Functional Testing: Record & Replay with XCTest

We leverage Xcode 26’s **record and replay** feature for streamlined UI test creation:

1. **Recording**  
   Place the cursor in a UI test function → click **Start Recording** → interact with the app → stop recording. Xcode converts actions into XCTest code using `XCUIElement`.

2. **Replay Across Configurations**  
   Use Test Plans to run recorded tests on multiple devices, locales, orientations, and system conditions in one batch.

3. **Review with Media**  
   Inspect results with the Test Report: watch video replays, see screenshots, and inspect UI elements to debug unexpected failures.

4. **Refine & Enhance**  
   Edit locators or add assertions. Recorded code includes multiple identifier options and media support for fast validation.

---

### 🚀 Benefits for QA
- Rapid test setup by example  
- Multi-device and multi-locale QA coverage  
- Direct debugging with recorded UI interactions  
- Seamless CI/CD integration via Xcode Cloud
