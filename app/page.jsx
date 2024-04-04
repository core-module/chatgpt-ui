import Sandbox from "./sandbox"

export const metadata = {
    title: "Secure GPT",
    description: 'Universal UI for OpenAI GPT-4',
    viewport: 'maximum-scale=1.0, minimum-scale=1.0, initial-scale=1.0, width=device-width, user-scalable=0',
    icons: {
        icon: '/logo192.png',
        shortcut: '/logo192.png',
    }
}

export default function Page() {
    return <Sandbox />
}
