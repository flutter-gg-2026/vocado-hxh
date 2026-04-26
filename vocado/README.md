# 🎙️ VocaDo: Your AI-Powered Task Manager

**VocaDo** is a mobile application designed to explore the integration of **Mobile Development** and **Generative AI**. It transforms natural speech into structured, actionable tasks, utilizing an AI-driven pipeline to route work based on user roles.

---

## 🛠️ Tech Stack Requirements

### 1. Mobile Framework & Architecture
*   **Flutter & Dart:** The core framework for cross-platform development.
*   **Clean Architecture:** Organised into `Data`, `Domain`, and `Presentation` layers to ensure scalability.
*   **BLoC Pattern:** For robust state management and event-driven logic.

### 2. The AI Pipeline (The "Brain" 🧠)
*   **Speech-to-Text (STT):** Utilising **Gladia API** or **OpenAI Whisper** for high-fidelity audio transcription.
*   **Natural Language Processing (NLP):** Powered by **Gemini 1.5 Flash** to parse raw text.
*   **Structured Output:** The AI is engineered to return a strict **JSON** object:
    ```json
    { 
      "task": "Update the design in Figma", 
      "assignee": "Rasha", 
      "due_date": "2026-04-23" 
    }
    ```

### 3. Role-Based Access Control (RBAC)
*   **Admin View:** Access to the **Voice Record Page** to capture audio and architect tasks.
*   **User View:** Access to the **Task Board** and **Task-index** to view and manage assigned work.

---

## 🏗️ Project Roadmap

### Phase 1: Authentication & Entry Points
*   Implementation of the `Login Page`.
*   Logic-gate routing to distinguish between `role: admin` and `role: user`.
*   Creation of the `Task-index` dashboard showing "New", "Late", and "In Progress" summaries.

### Phase 2: Voice Command Center (Admin)
*   Integration of the `record` package for high-quality audio capture.
*   Implementation of pulse animations for visual feedback during recording.
*   Development of "Opps!" error handling screens.

### Phase 3: AI Orchestration
*   Connecting the STT API to receive text transcripts.
*   System Prompt engineering for Gemini to ensure consistent JSON formatting.
*   Development of a **Task Confirmation** screen for manual verification before approval.

### Phase 4: State Management
*   Full implementation of **BLoC** to manage states: `Recording` ➔ `Transcribing` ➔ `Parsing` ➔ `Success`.

---

## 📂 Folder Structure
```text
lib/
 ├── core/              # Network info, DI (Get_it), Error handling
 ├── features/
 │   ├── auth/          # Login & Role Logic
 │   ├── task_creator/  # Admin: Record & AI Process
 │   └── task_viewer/   # User: Task List & Details
 └── main.dart
