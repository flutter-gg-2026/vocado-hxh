[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/hJTyw86k)
# 🎙️ VocaDo: Your Task Manager 
### *The Challenge: Transform Voice into Actionable Logic*

## 📝 Project Vision
**VocaDo** is a project built for developers to explore the intersection of **Mobile Development** and **Generative AI**. The goal is to build an application that doesn't just record audio, but "understands" it—converting natural speech into structured tasks and routing users based on their professional roles as defined in the system.

---

## 🛠️ Tech Stack Requirements
To successfully build VocaDo, you should implement the following technologies:

### 1. Mobile Framework & Architecture
* **Flutter & Dart:** The core framework.
* **Clean Architecture:** Separate the project into `Data`, `Domain`, and `Presentation` layers.
* **BLoC Pattern:** For robust state management and event-driven logic.

### 2. The AI Pipeline (The "Brain🧠")
* **Speech-to-Text (STT):** Suggested use of **Gladia API** or **OpenAI Whisper** to convert audio files into raw text.
* **Natural Language Processing (NLP):** Use an LLM (like **Gemini 1.5 Flash**) to parse the raw text.
    * *Challenge:* The AI must return a structured **JSON** object:
      ```json
      { "task": "Update the design in Figma", "assignee": "Rasha", "due_date": "2026-04-23" }
      ```

### 3. Role-Based Access Control (RBAC)
Implement a logic-gate during the login flow:
* **Admin View:** Access to the **Voice Record Page** to architect and assign tasks.
* **User View:** Access to the **Task Board** and **Task-index** to view assigned work.

---

## 🏗️ Suggested Project Roadmap (Design-Driven)

### Phase 1: Authentication & Entry Points
* **Login UI:** Build the `Login Page`.
* **Role Routing:** Implement logic to distinguish between `role: admin` and `role: user`.
* **Home Dashboard:** Create the `Task-index` screen showing the summary of "New", "Late", and "In Progress" tasks.

### Phase 2: The Voice Command Center (Admin Feature)
* **Audio Capture:** Integrate the `record` package in the `Voice recorded Page`.
* **Visual Feedback:** Use `Animations` to create a pulse effect on the microphone icon during recording.
* **Error Handling:** Build the `Error Status` ("Opps!") screen to handle failed recording attempts.

### Phase 3: AI Orchestration & Parsing
* **STT Integration:** Send audio to Gladia API to receive the transcript.
* **Prompt Engineering:** Send the transcript to Gemini with a System Prompt that forces a JSON response.
* **Task Confirmation:** Map the AI response to the `Task Details` screen so the Admin can verify the task before clicking "Approved".

### Phase 4: State Management
* Use **BLoC** to handle the loading states (`Recording` -> `Transcribing` -> `Parsing` -> `Success`).

## 📂 Expected Folder Structure
Students should follow this structure to maintain "Cleanliness":
```text
lib/
 ├── core/              # Network info, DI (Get_it), Error handling
 ├── features/
 │   ├── auth/          # Login & Role Logic
 │   ├── task_creator/  # Admin Feature: Record & AI Process
 │   └── task_viewer/   # User Feature: Task List & Details
 └── main.dart
```
---
## Ready to Start ! Check the project Design 
[Click ME](https://www.figma.com/design/orIarysJ6qilKJgHukQfgH/Untitled?node-id=0-1&t=oePpVXgvCfdIXwS2-1) |

#### All The Best ✨✨✨

